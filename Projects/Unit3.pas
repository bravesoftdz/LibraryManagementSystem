unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, DB, ADODB, Grids, DBGrids;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.Active:=false;
  ADOQuery1.SQL.Add('select * from book;');       //��ʾbook���е�����
  ADOQuery1.Prepared;
  ADOQuery1.Active:=true;
  Edit1.Text:='';
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  close;           //�˳�
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select * from book');            //��������һ��SQL����ֻ�����ֿ�д��
  ADOQuery1.SQL.Add('where ����='''+Edit1.Text+         //��book���в����������������������ݣ�������ȫ����ͬ����
                    '''and �������='''+Edit2.Text+
                    '''and ������='''+Edit3.Text+'''');
  ADOQuery1.Prepared;
  ADOQuery1.Open;
  ADOQuery1.Active:=true;
end;

end.
