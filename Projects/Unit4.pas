unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    Button1: TButton;
    DBGrid1: TDBGrid;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Label5: TLabel;
    Label6: TLabel;
    Edit4: TEdit;
    Label7: TLabel;
    Edit5: TEdit;
    Label8: TLabel;
    Edit6: TEdit;
    Label9: TLabel;
    Edit7: TEdit;
    DBGrid2: TDBGrid;
    ADOConnection2: TADOConnection;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.FormCreate(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  //ADOQuery1.Active:=false;
  ADOQuery1.SQL.Add('select * from book');   //Grid1��ʾbook��
  ADOQuery1.Prepared;
  ADOQuery1.Active:=true;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
  DBGrid1.Refresh;
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select * from book');       //Ѱ��������������ȫƥ�����
  ADOQuery1.SQL.Add('where ����='''+Edit1.Text+
                    '''and �������='''+Edit2.Text+
                    '''and ������='''+Edit3.Text+'''');
  ADOQuery1.Prepared;
  ADOQuery1.Open;
  ADOQuery1.Active:=true;
end;

procedure TForm4.Button2Click(Sender: TObject);    //���İ�ť����Ҫ�Ȳ�ѯ�ٽ���
  var i:integer;
      s:string;
      flag:integer;   //��¼�Ƿ��ظ�ԤԼ���涨ͬһ����ͬһ�첻���Խ���ͬ����
begin
   with ADOQuery1 do
   begin
    i:=fieldbyname('ʣ�����').Value-1;   //��¼������ʣ������Ƕ���
    if(i<0)then
     begin                             //��ʾʣ�����Ϊ0�����ɽ��
       showmessage('���Ѿ�����');
     end
    else                         //����ʣ�࣬�ɽ�
    begin
    flag:=0;   //0��ʾû���ظ�ԤԼ
    with ADOQuery2 do
    begin
     close;
     ADOQuery2.SQL.Clear;
     ADOQuery2.SQL.ADD('select * from reserve');              //��reserve���в����Ƿ�����ͬ�Ľ�����Ϣ
     ADOQuery2.SQL.ADD('where ����֤��='''+trim(Edit4.Text)+  //������ڣ�˵��ͬһ����֤����ͬһ�����ͬ������
                     '''and ͼ����='''+trim(Edit6.Text)+
                     '''and ����='''+trim(Edit7.Text)+'''');
     open;
     if (ADOQuery2.RecordCount>0) then   //recordCount����ADOQuery2�еļ�¼����Ŀ��������select�����ѡ��������
     begin                       //>0��ʾͬһ������ͬһ�����ͬһ����
     flag:=1;    //�ظ�ԤԼ���������ݿ���и���
     showmessage('�ظ�ԤԼ��');
     end
     else             //��ʣ����ɽ���û���ظ�����
      begin
        ADOQuery2.Active:=true;
        ADOQuery2.Insert;
        ADOQuery2.FieldByName('����֤��').Value:=trim(Edit4.Text);     //��Edit�е�����ȡ��
        ADOQuery2.FieldByName('����').Value:=trim(Edit5.Text);
        ADOQuery2.FieldByName('ͼ����').Value:=trim(Edit6.Text);
        ADOQuery2.FieldByName('����').Value:=trim(Edit7.Text);
        ADOQuery2.Post;      //�޸����ݿ⣬����Ӽ�¼
        ADOQuery2.ExecSQL;
        ADOQuery2.Close;
        ADOQuery2.SQL.Clear;
        ADOQuery2.SQL.Add('select * from reserve');
        ADOQuery2.SQL.Add('where ����֤��='''+trim(Edit4.Text)+
                        '''and ����='''+trim(Edit5.Text)+
                        '''and ͼ����='''+trim(Edit6.Text)+
                        '''and ����='''+trim(Edit7.Text)+'''');
        ADOQuery2.Prepared;
        ADOQuery2.Open;       //��������Ϣ��ʾ��Grid2��
     end;

    if (flag=1) then      //�ظ�����
     begin                //����ͼ���ʣ����������޸�
     end
    else                  //�ɹ�����
     begin
     str(i,s);            //��i��ֵ����һ���ַ����͵ı���s
     Close;
     SQL.Clear;
     SQL.Text:='update book set ʣ�����=:a where ͼ����=:b';    //��ͼ����Ϊb��ͼ�����ʣ�����
     parameters.ParamByName('a').Value:=i;
     parameters.ParamByName('b').Value:=trim(Edit6.Text);
     ExecSQL;
     close;
     end;
    end;
   end;

  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.Active:=false;
  ADOQuery1.SQL.Add('select * from book');
  ADOQuery1.Prepared;
  ADOQuery1.Active:=true;
 end;

 with ADOQuery2 do
    begin
    ADOQuery2.Close;
    ADOQuery2.SQL.Clear;
    ADOQuery2.Active:=false;
    ADOQuery2.SQL.Add('select * from reserve');
    ADOQuery2.SQL.Add('where ����֤��='''+trim(Edit4.Text)+
                    '''and ����='''+trim(Edit5.Text)+
                    '''and ͼ����='''+trim(Edit6.Text)+
                    '''and ����='''+trim(Edit7.Text)+'''');
    ADOQuery2.Prepared;
    ADOQuery2.Active:=true;
    end;
end;


procedure TForm4.Button3Click(Sender: TObject);
begin
  close;
end;

end.
