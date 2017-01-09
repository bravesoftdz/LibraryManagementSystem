unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
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
  Form5: TForm5;

implementation
uses Unit6,Unit7;

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
begin
   if((Edit1.Text='admin')and(Edit2.Text='admin'))then    //管理员账号密码
    begin
      //Unit6.Form6.FormCreate(Sender);
      Unit6.Form6.Show;          //跳转到Form6
    end
  else
    showmessage('输入正确的用户名或密码！');
    Edit1.Text:='';
    Edit2.Text:='';
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TForm5.Button3Click(Sender: TObject);
begin
    Unit7.Form7.FormCreate(Sender);      //跳转到Form7
    Unit7.Form7.Show;

end;

end.
