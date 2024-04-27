query 50100 "Books Available"
{
    Caption = 'Books Available';
    QueryType = Normal;
    UsageCategory = ReportsAndAnalysis;

    elements
    {
        dataitem(Book; Book)
        {
            column("Code"; "Code")
            {
            }
            column(Title; Title)
            {
            }
            column(Availability; Availability)
            {
                ColumnFilter = Availability = filter(> 0);
            }

            dataitem(Editor; Editor)
            {
                DataItemLink = "Code" = Book."Editor Code";
                SqlJoinType = InnerJoin;

                column(Name; Name)
                {
                }
            }
        }
    }

}
