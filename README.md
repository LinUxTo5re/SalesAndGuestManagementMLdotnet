# Guest and Sales Projection/Visualization Using Machine Learning in C# (ML.NET)

Welcome to the Sales and Guest Projection project repository!

- Explore the Sales and Guest Projection repository, utilizing ML.NET, C#, MVVM, Microsoft SQL Server and WPF.
- Predict future guests using advanced tech - historical data fuels projections for upcoming days.
- Tap into past actual and projected guests for accurate guest forecasts, a powerful business tool.
- The same logic can be applied for future sales projections using machine learning with the help of ML.NET.
- In bonus, take a look of data visualization where we've used Line chart and bar graph.

## Projected Results
**Projection - 1:** <br>
  ![image](https://github.com/aadarsh0001/SalesProjectionUsingMLdotNET/assets/117271222/99c01e95-2589-4327-a251-d14faf9cf387)
  <br> <br>
  **Projection - 2:** <br>
  ![image](https://github.com/aadarsh0001/SalesProjectionUsingMLdotNET/assets/117271222/183f597d-77d8-4a69-b6f6-b2a804b567f7)
    <br>
**Visualization Sample**<br>
![image](https://github.com/LinUxTo5re/SalesAndGuestManagementMLdotnet/assets/90641894/6675e439-6545-4667-9329-86c0188ca8d9)
    <br>

## Columns Definition
- **Time** : Column used to describe the timestamp for guest count.
- **Guest Count** : Actual guest count for the specified timestamp.
- **Projected MyStore** : Projected guest count using the Average algorithm in the existing application.
- **Projected ML** : Projected guest count using machine learning (ML.NET).
- **Difference ML** : **Guest Count - Projected ML**
- **Difference SDM** : **Guest Count - Projected MyStore**

## Technologies Used
- ML.NET
- OxyPlot (Data Visualization)
- C#
- MVVM (Model-View-ViewModel)
- Microsoft SQL Server Management (SSMS)
- WPF (Windows Presentation Foundation)

## Getting Started
Follow these steps to set up the project in Visual Studio:

### Requirements
- Visual Studio (Any version is compatible)
- Microsoft SQL Server
- .NET 5.0*

1. Clone or download the project repository to your local machine.
<pre>
<code>
git clone https://github.com/LinUxTo5re/SalesAndGuestManagementMLdotnet.git
</code>
</pre>
2. Open Microsoft SQL Server and set up a database. Execute the stored procedure provided in the `ML_POC.sql` file.
3. If you don't have access to our database, it's recommended to create your own SQL/NoSQL database and modify the code and queries according to your needs.
4. Unzip or open the downloaded folder or go to cloned directory in your system and double-click on `HourlySalesReport.sln` to open the project in Visual Studio.
5. Make a configuration adjustment: Search for `settings.settings` in the Solution Explorer's search bar and open `settings.settings`.
6. In the `settings.settings` page, locate the `data source` setting and update it with your server's name as demonstrated in `Screenshot-3`. Save the changes and close the `settings.settings` page.
7. Run the application and enjoy the code.

## Set Up SSMS Instance and Update settings.settings:
<br> <br>
    **Screenshot-1:** <br>
    ![image](https://github.com/aadarsh0001/SalesProjectionUsingMLdotNET/assets/117271222/bbffc772-8648-479b-a73a-c2fe49f544c4)
    <br> <br>
    **Screenshot-2:** <br>
    ![image](https://github.com/aadarsh0001/SalesProjectionUsingMLdotNET/assets/117271222/a05ceaef-84e5-4e92-bd6c-e78f89a428ac)
    <br> <br>
    **Screenshot-3:**<br>
    ![image](https://github.com/aadarsh0001/SalesProjectionUsingMLdotNET/assets/117271222/6ab88ef4-7c49-4548-99a3-52cb665e9385)
    <br> <br>

## Contributors
- Aadarsh Tiwari: https://github.com/aadarsh0001

Licensed under **GNU**
