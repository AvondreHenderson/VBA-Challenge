Attribute VB_Name = "Module1"
Sub TickerFInd():
    'set the table names for the values we are looking for
    Range("I1:L1").Value = Array("Ticker", "Yearly Change", "Percent Change", "Total")
    
    
    'set the intial variable for storing the ticker name
    Dim TickerName As String
    'Set the variable for the yearly change as double as it includes decimal places up to two digits
    Dim yearlyChange As Double
    'set the variable for the percent change increase or decrease over the year
    Dim percentChange As Double
    'Set the variable for the total yearly volume
    Dim totalYearly As Long
    'define what row the summary table starts on
    Dim Summary_Table_Row As Integer
    Summary_Table_Row = 2
    
    'find the last row in the dataset and store it for use as a variable when the table is created
    Dim lastRow As Long
    lastRow = Cells(Rows.Count, 1).End(xlUp).Row
    
    'find the last blank value in the row for "ticker"
    For i = 2 To lastRow
        'check to see what tickers are included
        If Cells(i + 1, 1).Value <> Cells(i, 1).Value Then
        
            'set the ticker name
            TickerName = Cells(i, 1).Value
            
            'find the value of the opening and closing values and add them into the table next to the respective ticket
            'add variable for the opening and closing values to use during the function and set to the value in the respective column
            Dim openingPrice As Double
            openingPrice = Cells(i, 3).Value
            Dim closingPrice As Double
            closingPrice = Cells(i, 5).Value
            'Find the value of the total for the year for the respective year
            yearlyChange = openingPrice - closingPrice
            
            'Find the value of the total yearly sales
            totalYearly = Cells(i, 7).Value
            'Find the value for the percent change using the closing and opening price
            percentChange = ((closingPrice - openingPrice) / openingPrice) * 100 'format this so it will come out as a percentage
            
    
            
            'print the ticker name
            Range("I" & Summary_Table_Row).Value = TickerName
            'print the yearly change
            Range("j" & Summary_Table_Row).Value = yearlyChange
            
            'print the yearly percent change
            Range("k" & Summary_Table_Row).Value = percentChange
            'change the range to display percentages
            Range("k" & Summary_Table_Row).NumberFormat = "0.00%"
            
            
            'print the total value
            Range("L" & Summary_Table_Row).Value = totalYearly
            
            
            'define the color GREEN to all values > 0 and define all values <= 0 RED
                If yearlyChange > 0 Then
                    Range("j" & Summary_Table_Row).Interior.ColorIndex = 4
                    Else: Range("j" & Summary_Table_Row).Interior.ColorIndex = 3
                     
                End If
                
            'THIS HAS TO BE THE LAST STEP AT THE END OF THE IF STATEMENT IF NOT IT WILL REVERSE EVERYTHING AND START OVER.
            'add one to the summary table row for the next ticker name
            Summary_Table_Row = Summary_Table_Row + 1
            
        End If
        
    Next i
    
      
End Sub


'This code will interpret the chart that was created from the last function
Sub Greatest_Value_Finder():

'Fill in column headers for the new chart
Range("P1:Q1").Value = Array("Ticker", "Value")
'Fill in the row headers for the chart
'Range("02").Value = "Greatest Percentage Increase"
'Range("O3").Value = "Greatest Percentage Decrease"
'Range("O4").Value = "Greatest Total Volume"

 'find the last row in the dataset and store it for use as a variable when the table is created
 Dim lastRow As Long
 lastRow = Cells(Rows.Count, 9).End(xlUp).Row
 

' Define all the variables for the greatest percent increase, decrease, and highest total volume, make the"greatestTotalVolume" as a Long.
' the "greaterIncrease" and "greaterDecrease" variables should be doubles.
Dim greatestIncrease As Double
Dim greatestDecrease As Double
Dim greatestTotalVolume As Long
'define where to start inputting the values
Dim Summary_Table_Row As Integer
Summary_Table_Row = 2

'use the index macth function to return the requested values
greatestTotalVolume = WorksheetFunction.Max("L") , Range("L"))






End Sub




