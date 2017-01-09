unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,DBCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses Unit2,Unit3,Unit4,Unit5,Unit6,Unit7;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Unit3.Form3.DBNavigator1.VisibleButtons:=[nbFirst,nbPrior,nbNext,
           nbLast,nbInsert,nbDelete,nbEdit,nbPost,nbCancel,nbRefresh];   //�������ת��Form3 ����DBNavi
  Unit2.Form2.Show;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Unit4.Form4.Show;    //��ת��Form4
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Unit5.Form5.Show;    //��ת��Form5
end;

end.