table 50101 "BCA Beer Setup"
{
    Caption = 'Beer Setup';
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key', locked = true;
        }
        field(2; "Azure URL"; Text[250])
        {
            Caption = 'Azure URL';
        }
        field(3; "Azure Function Name"; Text[250])
        {
            Caption = 'Azure Function Name';
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}