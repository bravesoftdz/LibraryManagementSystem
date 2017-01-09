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
  ('select ����֤��,����,book.ͼ����,����,���� from reserve,book');  //��2���е�ͼ�����Щ��Ϣ��ʾ��Grid1��
  ADOQuery1.SQL.Add('where ����֤��='''+Edit1.Text+'''');     //ͼ��Ϊ�ý���֤�Ž赽����
  ADOQuery1.SQL.Add('and book.ͼ����=reserve.ͼ����;');
  ADOQuery1.Prepared;
  ADOQuery1.Open;
  ADOQuery1.Active:=true;
end;

end.
