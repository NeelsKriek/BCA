codeunit 50100 "BCA Settings Management"
{
    [EventSubscriber(ObjectType::Table, 50100, 'OnBeforeValidateEvent', 'Code', false, false)]
    local procedure OnBeforeBeerCategoryCodeValidate(Rec: Record "BCA Beer Category"; xRec: Record "BCA Beer Category");
    var
        notBeerMessage: Label 'This is not beer';

    begin
        if strpos(rec.Code, 'WINE') > 0 then
            error(notBeerMessage);
    end;

    procedure ExportBeerCategories()
    var
        TmpBlob: Record TempBlob temporary;
        ExportBeerCategories: XmlPort "BCA Beer Categories";
        OutStr: OutStream;
        InStr: InStream;
        FileName: Text;
        FileNameLabel: Label 'BeerCategories.xml';
        DialogTitleLabel: Label 'Beer Categories Export';
    begin
        TmpBlob.Init();
        TmpBlob.Blob.CreateOutStream(OutStr);
        ExportBeerCategories.SetDestination(OutStr);
        ExportBeerCategories.Export();
        TmpBlob.Blob.CreateInStream(InStr);
        FileName := FileNameLabel;
        file.DownloadFromStream(InStr, DialogTitleLabel, '', '', FileName);
    end;

    procedure ImportBeerCategories();
    var
        TmpBlob: Record TempBlob temporary;
        ImportBeerCategories: XmlPort "BCA Beer Categories";
        InStr: InStream;
        FileName: Text;
        DialogTitleLabel: Label 'Select XML file for Import';
        FromFilterLabel: Label 'XML Files (*.xml)|*.xml', locked = true;
    begin
        TmpBlob.Init();
        TmpBlob.Blob.CreateInStream(InStr);
        file.UploadIntoStream(DialogTitleLabel, '', FromFilterLabel, FileName, InStr);
        ImportBeerCategories.SetSource(InStr);
        ImportBeerCategories.Import();
    end;
}