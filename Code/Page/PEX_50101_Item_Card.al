pageextension 50102 "BCA Item Card" extends "Item Card"
{
    layout
    {
        addlast(Content)
        {
            group(BCA_Beer_Category)
            {
                Caption = 'BCA Beer Category';

                field("BCA Beer Category Code Name"; "BCA Beer Category Code")
                {
                    ApplicationArea = All;
                    Caption = 'My Beer Category';
                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                        /*                         if "BCA Beer Category Code" = 'TEST' then
                                                    "BCA Beer Category Code Name".Visible(False);
                         */
                    end;
                }

                field("BCA Beer Category Name"; "BCA Beer Category Name")
                {
                    ApplicationArea = All;
                }

            }
        }

    }
    actions
    {

    }

    var
        myInt: Integer;
}