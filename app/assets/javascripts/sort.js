/*
    function sort() : This function uses a simple sort to sort a table
        into ascending order.
    param colToSort: index value of the column to sort by
    param tableId:   html id value of the table that will be sorted
*/
function sortText(colToSort,tableId){
    var table = document.getElementById(tableId); //Create a table object
    var rows = table.rows;  //Create an array representing all the rows as elements
    var current, next;  //Holds the value of the now and the next

    // Find out the number of rows and store in numRows variable
    var numRows = 0;
    for (i = 0; i < rows.length; i++) {
        if (rows[i].getElementsByTagName("td").length > 0) {
            numRows += 1;
        }
    }

    /*The next two for-loops iterate through all rows in table and sorts them
    into ascending order */
    for(i = 1; i < numRows; i++){
        for(j = 1; j < numRows; j++){
            current = rows[j].getElementsByTagName("td")[colToSort];
            next = rows[j + 1].getElementsByTagName("td")[colToSort];

            //Check if the values need swapped
            if(current.innerHTML.toLowerCase() > next.innerHTML.toLowerCase()){
                rows[j].parentNode.insertBefore(rows[j + 1], rows[j]); //Swap the values
            }

        }  // End of inner for-loop
    } //End of outer for-loop
}  // End of sort function