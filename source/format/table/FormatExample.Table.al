table 50115 "Format Example"
{
    Caption = 'Format Example';
    DataClassification = CustomerContent;

    fields
    {
        field(1; Id; Integer)
        {
            Caption = 'Id';
        }
        field(2; "Expression Format"; Text[80])
        {
            Caption = 'Expression Format';

            trigger OnValidate()
            begin
                FormatValue();
            end;
        }
        field(3; "Format Type"; enum "Format Types")
        {
            Caption = 'Format Type';

            trigger OnValidate()
            begin
                Rec."Date Value" := 0D;
                Rec."Date/Time Value" := 0DT;
                Rec."Decimal Value" := 0;
                Rec."Int Value" := 0;
                Rec."Expression Format" := '';
            end;
        }
        field(30; "Date Value"; Date)
        {
            Caption = 'Date Value';

            trigger OnValidate()
            begin
                FormatValue();
            end;
        }
        field(40; "Int Value"; Integer)
        {
            Caption = 'Int Value';

            trigger OnValidate()
            begin
                FormatValue();
            end;
        }
        field(50; "Decimal Value"; Decimal)
        {
            Caption = 'Decimal Value';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                FormatValue();
            end;
        }
        field(60; "Date/Time Value"; DateTime)
        {
            Caption = 'Date/Time Value';

            trigger OnValidate()
            begin
                FormatValue();
            end;
        }
        field(70; "Format Text"; Text[250])
        {
            Caption = 'Format Text';
            Editable = false;
        }
    }
    keys
    {
        key(PK; Id)
        {
            Clustered = true;
        }
    }

    local procedure FormatValue()
    begin

        Rec."Format Text" := '';

        case Rec."Format Type" of

            "Format Types"::Date:
                if Rec."Expression Format" = '' then
                    Rec."Format Text" := Format(Rec."Date Value", 0, '<Day,2>-<Month,2>-<Year>')
                else
                    Rec."Format Text" := Format(Rec."Date Value", 0, Rec."Expression Format");

            "Format Types"::DateTime:
                if Rec."Expression Format" = '' then
                    Rec."Format Text" := Format(Rec."Date/Time Value", 0, '<Day,2>-<Month,2>-<Year> <Hours24><Filler Character,0>:<Minutes,2><Filler Character,0>:<Seconds,2><Filler Character,0>')
                else
                    Rec."Format Text" := Format(Rec."Date/Time Value", 0, Rec."Expression Format");

            "Format Types"::Decimal:
                if Rec."Expression Format" = '' then
                    Rec."Format Text" := Format(Rec."Decimal Value", 0, '<Sign><Integer Thousand><Decimals>')
                else
                    Rec."Format Text" := Format(Rec."Decimal Value", 0, Rec."Expression Format");

            "Format Types"::Integer:
                if Rec."Expression Format" = '' then
                    Rec."Format Text" := Format(Rec."Int Value", 0, '<Integer>')
                else
                    Rec."Format Text" := Format(Rec."Int Value", 0, Rec."Expression Format");

        end;
    end;
}
