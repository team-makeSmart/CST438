/*
Below is an example of what needs to go into the html page in order to load the chart
Note that parameters may need to change in the functions

  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
  <canvas id="pie-chart" width="700" height="400"></canvas>
  <script> window.onload = function() {pieChart(2,1,"customers");};</script>
*/  
  
  
/*
function pieChart()  :  This will create a pie chart based on two columns in a table
param categoryColNum : This is the column number of the category
param amountColNum : This is the column number of a currency amount in text form with a $ in front
    Note that the the $ sign will be sliced off and the amount converted from text to float
param tableId : This is the tableId of the HTML table where the data comes from
*/  
function pieChart(categoryColNum, amountColNum, tableId){

    var i, j;   //iterators for for-loops
    var table = document.getElementById(tableId);   //Create a table object
    var rows = table.rows;  //Create an array representing with rows as elements

    // Find out the number of rows and store in numRows variable
    var numRows = 0;
    for (i = 0; i < rows.length; i++) {
        if (rows[i].getElementsByTagName("td").length > 0) {
            numRows += 1;
        }
    }

    // If the table has now rows, return and do not display a graph
    if(numRows == 0){
      return;
    }

    //Create empty arrays that will be populated for the graph
    var categoryArray = [];
    var dataArray = [];

    //To hold temporary values
    var tempCategory, tempAmount;

    // Populate the arrays from values in the table
    for (i = 1; i < numRows + 1; i++){
      // Put values into temp variables
      tempCategory = rows[i].getElementsByTagName("td")[categoryColNum].innerHTML.trim();
      tempAmount = parseFloat(rows[i].getElementsByTagName("td")[amountColNum].innerHTML.slice(1));

      /*We don't want to show the same category twice
        so below checks if the category is already in the array
        And if the category is already in the array, just add to the amount
      */
      if(categoryArray.includes(tempCategory)){ //if true, category is in the categoryArray
        for(j = 0; j < numRows; j++){
            if(categoryArray[j] == tempCategory){
              dataArray[j] = dataArray[j] + tempAmount;
            }
        } //End of inner for loop
      }else{  //Else the category is not already in the categoryArray
        categoryArray.push(tempCategory);
        dataArray.push(tempAmount);
      }
    }

    //colorsArray holds the various colors of the graph
    var colorsArray = ["#588c7e", "#f2e394","#f2ae72"," #d96459","#96ceb4",
      '#ffeead', '#ffcc5c',  '#ff6f69', '#674d3c', '#a79e84'];

    //Create the chart object
    new Chart(document.getElementById("pie-chart"), {
        type: 'pie',
        data: { labels: categoryArray, datasets: [{
            label: "TOP CATEGORIES",
            backgroundColor: colorsArray,
            data: dataArray    }]
        },
        options: { title: {
            display: true,
            text: 'TOTAL SPENT FOR TOP CATEGORIES'
          }
        }
    });
  } //End of piechart function
