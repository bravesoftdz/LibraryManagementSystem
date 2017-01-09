unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    Label2: TLabel;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    ADOConnection2: TADOConnection;
    ADOQuery2: TADOQuery;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.Active:=false;
    ADOQuery1.SQL.Add('select * from reserve;');      //Grid1显示reserve表的内容
    ADOQuery1.Prepared;
    ADOQuery1.Active:=true;
  end;

  with ADOQuery2 do
  begin
    ADOQuery2.Close;
    ADOQuery2.SQL.Clear;
    ADOQuery2.Active:=false;
    ADOQuery2.SQL.Add        //将被借出的书的图书编号以及借阅数量提取出来在Grid2显示
    ('select book.图书编号,书名,count(*) as 借阅数量 from reserve,book where book.图书编号=reserve.图书编号 group by book.图书编号,书名;');
    ADOQuery2.Prepared;
    ADOQuery2.Active:=true;
  end;

end;

end.
