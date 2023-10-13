pageextension 50201 "BSCL Customer Card" extends "Customer Card"
{
    actions
    {
        addlast(navigation)
        {
            action("BSCL FavoriteBookCard")
            {
                Caption = 'Book Card';
                ApplicationArea = All;
                Image = Card;
                ToolTip = 'Executes the Book Card action.';
                Enabled = Rec."BSB Favorite Book No." <> '';

                trigger OnAction()
                begin
                    Rec.ShowFavoriteBook();
                end;
            }
        }
        addafter(Email_Promoted)
        {
            actionref("FavoriteBookCard_Promoted"; "BSCL FavoriteBookCard") { }
        }
    }
}