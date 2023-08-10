SELECT 
    BusinessDayDate,
    SUM(TotalGuests) AS SumTotalGuests
FROM (
    SELECT 
        BusinessDayDate, 
        TimeSegmentID, 
        TotalGuests,
        (ROW_NUMBER() OVER (PARTITION BY BusinessDayDate ORDER BY TimeSegmentID) - 1) / 4 AS GroupNumber
    FROM CO_CashPlanningTimeSegments
    WHERE BusinessDayDate < '2023-04-11' AND BusinessDayDate >= '2023-01-01'
) AS GroupedData
GROUP BY BusinessDayDate, GroupNumber
ORDER BY BusinessDayDate, MIN(TimeSegmentID);



CREATE PROCEDURE GetSalesDataByBusinessDay
    @bussinessday DATE
AS
BEGIN
    SELECT
        --[Project1].[C10] AS [C1],
        [Project1].[C6] AS [Year],
        [Project1].[C7] AS [Month],
        [Project1].[C8] AS [Day],
        [Project1].[C9] AS [Hour],
        [Project1].[C3] AS [GuestCount]
    FROM
        (SELECT
            [GroupBy1].[A1] AS [C1],
            [GroupBy1].[A2] AS [C2],
            [GroupBy1].[A3] AS [C3],
            [GroupBy1].[A4] AS [C4],
            [GroupBy1].[A5] AS [C5],
            [GroupBy1].[K1] AS [RetailTransactionTypeCode],
            [GroupBy1].[K2] AS [TransactionStatus],
            [GroupBy1].[K3] AS [Name],
            [GroupBy1].[K4] AS [C6],
            [GroupBy1].[K5] AS [C7],
            [GroupBy1].[K6] AS [C8],
            [GroupBy1].[K7] AS [C9],
            1 AS [C10]
        FROM
            (SELECT
                [Filter2].[K1] AS [K1],
                [Filter2].[K2] AS [K2],
                [Filter2].[K3] AS [K3],
                [Filter2].[K4] AS [K4],
                [Filter2].[K5] AS [K5],
                [Filter2].[K6] AS [K6],
                [Filter2].[K7] AS [K7],
                SUM([Filter2].[A1]) AS [A1],
                SUM([Filter2].[A2]) AS [A2],
                COUNT([Filter2].[A3]) AS [A3],
                SUM([Filter2].[A4]) AS [A4],
                SUM([Filter2].[A5]) AS [A5]
            FROM
                (SELECT
                    [Filter1].[RetailTransactionTypeCode] AS [K1],
                    [Filter1].[TransactionStatus] AS [K2],
                    [Extent3].[Name] AS [K3],
                    DATEPART(year, [Filter1].[BeginDateTimestamp]) AS [K4],
                    DATEPART(month, [Filter1].[BeginDateTimestamp]) AS [K5],
                    DATEPART(day, [Filter1].[BeginDateTimestamp]) AS [K6],
                    DATEPART(hour, [Filter1].[BeginDateTimestamp]) AS [K7],
                    [Filter1].[TotalTransactionAmount] AS [A1],
                    [Filter1].[TotalTax] AS [A2],
                    1 AS [A3],
                    [Filter1].[NonProductAmount] AS [A4],
                    [Filter1].[NonProductTax] AS [A5]
                FROM
                    (SELECT
                        [Extent1].[RetailTransactionTypeCode] AS [RetailTransactionTypeCode],
                        [Extent1].[TransactionStatus] AS [TransactionStatus],
                        [Extent1].[TotalTransactionAmount] AS [TotalTransactionAmount],
                        [Extent1].[TotalTax] AS [TotalTax],
                        [Extent1].[NonProductAmount] AS [NonProductAmount],
                        [Extent1].[NonProductTax] AS [NonProductTax],
                        [Extent1].[PODtypeID] AS [PODtypeID],
                        [Extent2].[BusinessDayDate] AS [BusinessDayDate],
                        [Extent2].[BeginDateTimestamp] AS [BeginDateTimestamp]
                    FROM
                        [dbo].[TR_RetailTransaction] AS [Extent1]
                        INNER JOIN [dbo].[TR_Transaction] AS [Extent2] ON [Extent1].[TransactionID] = [Extent2].[TransactionID]
                    WHERE
                        [Extent2].[SessionStartTransactionID] IS NOT NULL
                        AND [Extent2].[BusinessDayDate] < @bussinessday AND [Extent2].[BusinessDayDate] >= '2023-01-01' -- Parameter used here
                    ) AS [Filter1]
                    INNER JOIN [dbo].[ID_PODtype] AS [Extent3] ON [Filter1].[PODtypeID] = [Extent3].[PODtypeID]
            ) AS [Filter2]
            GROUP BY [K1], [K2], [K3], [K4], [K5], [K6], [K7]
        ) AS [GroupBy1]
    ) AS [Project1]
    WHERE [Project1].[TransactionStatus] = 'SOLD'
    ORDER BY [Project1].[C6] ASC, [Project1].[C7] ASC, [Project1].[C8] ASC, [Project1].[C9] ASC
END




exec GetSalesDataByBusinessDay '20230411'
