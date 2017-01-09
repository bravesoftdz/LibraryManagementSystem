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
  ADOQuery1.SQL.Add('select * from book');   //Grid1显示book表
  ADOQuery1.Prepared;
  ADOQuery1.Active:=true;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
  DBGrid1.Refresh;
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select * from book');       //寻找与输入内容完全匹配的书
  ADOQuery1.SQL.Add('where 书名='''+Edit1.Text+
                    '''and 出版年份='''+Edit2.Text+
                    '''and 出版社='''+Edit3.Text+'''');
  ADOQuery1.Prepared;
  ADOQuery1.Open;
  ADOQuery1.Active:=true;
end;

procedure TForm4.Button2Click(Sender: TObject);    //借阅按钮，需要先查询再借阅
  var i:integer;
      s:string;
      flag:integer;   //记录是否重复预约，规定同一个人同一天不可以借相同的书
begin
   with ADOQuery1 do
   begin
    i:=fieldbyname('剩余册数').Value-1;   //记录如果借出剩余册数是多少
    if(i<0)then
     begin                             //表示剩余册数为0，不可借出
       showmessage('书已经借完');
     end
    else                         //书有剩余，可借
    begin
    flag:=0;   //0表示没有重复预约
    with ADOQuery2 do
    begin
     close;
     ADOQuery2.SQL.Clear;
     ADOQuery2.SQL.ADD('select * from reserve');              //在reserve表中查找是否有相同的借阅信息
     ADOQuery2.SQL.ADD('where 借书证号='''+trim(Edit4.Text)+  //如果存在，说明同一借书证号在同一天借了同样的书
                     '''and 图书编号='''+trim(Edit6.Text)+
                     '''and 日期='''+trim(Edit7.Text)+'''');
     open;
     if (ADOQuery2.RecordCount>0) then   //recordCount返回ADOQuery2中的记录的数目，即上面select语句所选择的语句数
     begin                       //>0表示同一人已在同一天借了同一本书
     flag:=1;    //重复预约，不对数据库进行更改
     showmessage('重复预约！');
     end
     else             //有剩余书可借且没有重复借阅
      begin
        ADOQuery2.Active:=true;
        ADOQuery2.Insert;
        ADOQuery2.FieldByName('借书证号').Value:=trim(Edit4.Text);     //将Edit中的内容取出
        ADOQuery2.FieldByName('姓名').Value:=trim(Edit5.Text);
        ADOQuery2.FieldByName('图书编号').Value:=trim(Edit6.Text);
        ADOQuery2.FieldByName('日期').Value:=trim(Edit7.Text);
        ADOQuery2.Post;      //修改数据库，即添加记录
        ADOQuery2.ExecSQL;
        ADOQuery2.Close;
        ADOQuery2.SQL.Clear;
        ADOQuery2.SQL.Add('select * from reserve');
        ADOQuery2.SQL.Add('where 借书证号='''+trim(Edit4.Text)+
                        '''and 姓名='''+trim(Edit5.Text)+
                        '''and 图书编号='''+trim(Edit6.Text)+
                        '''and 日期='''+trim(Edit7.Text)+'''');
        ADOQuery2.Prepared;
        ADOQuery2.Open;       //将借阅信息显示在Grid2中
     end;

    if (flag=1) then      //重复借阅
     begin                //不对图书的剩余册数进行修改
     end
    else                  //成功借阅
     begin
     str(i,s);            //将i的值传给一个字符类型的变量s
     Close;
     SQL.Clear;
     SQL.Text:='update book set 剩余册数=:a where 图书编号=:b';    //对图书编号为b的图书更新剩余册数
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
    ADOQuery2.SQL.Add('where 借书证号='''+trim(Edit4.Text)+
                    '''and 姓名='''+trim(Edit5.Text)+
                    '''and 图书编号='''+trim(Edit6.Text)+
                    '''and 日期='''+trim(Edit7.Text)+'''');
    ADOQuery2.Prepared;
    ADOQuery2.Active:=true;
    end;
end;


procedure TForm4.Button3Click(Sender: TObject);
begin
  close;
end;

end.
