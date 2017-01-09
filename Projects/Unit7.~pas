unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids;

type
  TForm7 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

procedure TForm7.FormCreate(Sender: TObject);
begin
  //ADOQuery1.Active:=false;  
end;

procedure TForm7.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TForm7.Button1Click(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
  ('select 借书证号,姓名,book.图书编号,书名,日期 from reserve,book');  //将2表中的图书的这些信息显示在Grid1中
  ADOQuery1.SQL.Add('where 借书证号='''+Edit1.Text+'''');     //图书为该借书证号借到的书
  ADOQuery1.SQL.Add('and book.图书编号=reserve.图书编号;');
  ADOQuery1.Prepared;
  ADOQuery1.Open;
  ADOQuery1.Active:=true;
end;

end.
