class DashboardController < ApplicationController


  def index

    unless params['from'].nil? || params['to'].nil?

    @from = params['from']
    @to = params['to']

    @last_expense = Expense.first.created_at.strftime("%Y-%m-%d")

    # records = Expense.select(:amount, :created_at).where("created_at >= ? AND created_at <= ? ","#{@from} 00:00:01","#{@to} 23:59:59")
    records = Expense.select(:amount, :created_at).where(created_at: (Date.parse(@from) -1.day)...Date.parse(@to)+ 1.day)

    @empty_records = records == []
    amount, date = data_to_json(records)
    chart(amount, date)
    end
  end


  private

  def data_to_json(records)
    amount = []
    date = []
    index = 0

    records.length.times do
      amount.push(JSON.parse(JSON 'value' => records[index]['amount']))
      date.push(JSON.parse(JSON 'label' => records[index]['created_at'].strftime("%Y-%m-%d")))
      index += 1
    end
    [amount, date]
  end

  def chart(amount, date)
    # @chart = Fusioncharts::Chart.new(
    #     {
    #         width: "1000",
    #         height: "400",
    #         type: "mscolumn3d",
    #         renderAt: "chartContainer",
    #         dataSource: {
    #             chart: {
    #                 caption: "Expenses from #{@from}, " + "to #{@to}",
    #                 xAxisname: "Dates",
    #                 yAxisName: "value ($)",
    #                 numberPrefix: "$",
    #                 theme: "fint",
    #             },
    #             categories: [{category: date}],
    #             dataset: [{data: amount}]
    #         }
    #     })


    @chart = Fusioncharts::Chart.new({
                                         width: "600",
                                         height: "400",
                                         type: "mscolumn2d",
                                         renderAt: "chartContainer",
                                         dataSource: {
                                             chart: {
                                                 caption: "Comparison of Quarterly Revenue",
                                                 subCaption: "Harry's SuperMart",
                                                 xAxisname: "Quarter",
                                                 yAxisName: "Amount ($)",
                                                 numberPrefix: "$",
                                                 theme: "fint",
                                                 exportEnabled: "1",
                                             },
                                             categories: [{
                                                              category: [
                                                                  { label: "Q1" },
                                                                  { label: "Q2" },
                                                                  { label: "Q3" },
                                                                  { label: "Q4" }
                                                              ]
                                                          }],
                                             dataset: [
                                                 {
                                                     seriesname: "Previous Year",
                                                     data: [
                                                         { value: "10000" },
                                                         { value: "11500" },
                                                         { value: "12500" },
                                                         { value: "15000" }
                                                     ]
                                                 },
                                                 {
                                                     seriesname: "Current Year",
                                                     data: [
                                                         { value: "25400" },
                                                         { value: "29800" },
                                                         { value: "21800" },
                                                         { value: "26800" }
                                                     ]
                                                 }
                                             ]
                                         }
                                     })
  end


end

