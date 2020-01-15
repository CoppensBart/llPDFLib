unit App;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Printers
  
  ,llPDFDocument,llPDFTypes
  ;

type
  TForm1 = class(TForm)
    bRenderMetafile: TButton;
    cbOpenResult: TCheckBox;
    procedure RenderMetafile(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    TestMetafile: string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.RenderMetafile(Sender: TObject);
const
  PS_POINTS_IN_MILLIMETER = 0.03937007874015748031496062992126 * 72;
var
  Doc: TPDFDocument;
  MF: TMetafile;
  RefDC: HDC;
begin
  Doc:= TPDFDocument.Create(nil);
  MF:= TMetafile.Create;
  try
    try
      MF.LoadFromFile(TestMetafile);
      RefDC:= Windows.CreateDC('WINSPOOL',PChar(Printer.Printers[Printer.PrinterIndex]),nil,nil);
      Doc.FileName:= ExtractFilePath((ParamStr(0))) + 'data\PDFFiles\TestRenderMetafile.pdf';
      Doc.AutoLaunch:= cbOpenResult.Checked;
      Doc.EMFOptions.UsedDC:= RefDC;
      Doc.BeginDoc;

      Doc.CurrentPage.Width:= Round(PS_POINTS_IN_MILLIMETER * MF.MMWidth) div 100;
      Doc.CurrentPage.Height:= Round(PS_POINTS_IN_MILLIMETER * MF.MMHeight) div 100;

      Doc.CurrentPage.PlayMetaFile(MF);

      Doc.EndDoc;

    except

    end;
  finally
    FreeAndNil(Doc);
    DeleteDC(RefDC);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TestMetafile:= ExtractFilePath((ParamStr(0))) + 'data\images\metafile1.emf';

  bRenderMetafile.Enabled:= FileExists(TestMetafile);
  if bRenderMetafile.Enabled then
    RenderMetafile(bRenderMetafile);
    
end;

end.
