unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DirectShow9, DsUtil, DSPack, ExtCtrls, StdCtrls, Menus, ExtDlgs, DB,
  ADODB, CPort, Grids, DBGrids;

type
  TForm1 = class(TForm)
    FilterGraph1: TFilterGraph;
    SampleGrabber1: TSampleGrabber;
    Filter1: TFilter;
    SavePictureDialog1: TSavePictureDialog;
    Timer1: TTimer;
    GroupBox1: TGroupBox;
    VideoWindow1: TVideoWindow;
    GroupBox2: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    GroupBox3: TGroupBox;
    Button1: TButton;
    ComboBox1: TComboBox;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Shape1: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape2: TShape;
    StaticText1: TStaticText;
    ComPort1: TComPort;
    Button6: TButton;
    Edit1: TEdit;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure listingDevice;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ComPort1RxChar(Sender: TObject; Count: Integer);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  CapEnum: TSySDevEnum;
    data,data1 : byte;
    Stream : TMemoryStream;
    waktu,tanggal : string;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
TimeSeparator:=':';
DateSeparator:='-';
waktu :=TimeToStr(time);
tanggal:=datetostr(now);
//image2.Picture.SaveToFile('D:\test\'+tanggal+'.jpg');
samplegrabber1.GetBitmap(Image1.Picture.Bitmap);
image2.Picture :=image1.picture;
Stream:=TMemorystream.Create;
Image1.Picture.Graphic.SaveToStream(stream);
Stream.Position:=0;
Adoquery1.Append;
Adoquery1.FieldByName('waktu').AsString:=waktu;
Adoquery1.FieldByName('tanggal').AsString:=tanggal;
Tblobfield(Adoquery1.FieldByName('foto')).LoadFromStream(stream);
Stream.Free;
Adoquery1.Post;
Timer1.Enabled:=True;
//showmessage('terjadi pelanggaran');
end;

procedure TForm1.ComboBox1Click(Sender: TObject);
begin
  FilterGraph1.ClearGraph;
  FilterGraph1.Active := false;
  Filter1.BaseFilter.Moniker :=capenum.GetMoniker(combobox1.ItemIndex);
  FilterGraph1.Active := true;
  with FilterGraph1 as ICaptureGraphBuilder2 do
    RenderStream(@PIN_CATEGORY_PREVIEW,nil, Filter1 as IBaseFilter, SampleGrabber1 as IBaseFilter, VideoWindow1 as IbaseFilter);
  FilterGraph1.Play;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  capenum.Free;
  FilterGraph1.ClearGraph;
  FilterGraph1.Active := false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  listingDevice;
end;

procedure TForm1.listingDevice;
var i: integer;
begin
  CapEnum:=TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);
  For i:=0 to CapEnum.CountFilters-1 do
  begin
    combobox1.Items.Add(CapEnum.Filters[i].FriendlyName);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
comport1.Open;
shape2.Brush.Color:= clGreen;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
comport1.ShowSetupDialog;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
//TimeSeparator:=':';
//DateSeparator:='-';
//waktu :=TimeToStr(time);
//tanggal:=datetostr(now);
//image2.Picture.SaveToFile('D:\test\'+tanggal+'.jpg');
timer1.Enabled:=false;
end;

procedure TForm1.ComPort1RxChar(Sender: TObject; Count: Integer);
var
Str : integer;
begin
comPort1.Read(Str,Count);
data:=(Str);
Edit1.Text :=inttostr(data);
if(data = $01) then
begin
Shape1.Brush.Color:=clBlack;
Shape3.Brush.Color:=clBlack;
Shape4.Brush.Color:=clRed;
end
else if(data = $02) then
begin
Shape1.Brush.Color:=clBlack;
Shape3.Brush.Color:=clYellow;
Shape4.Brush.Color:=clBlack;

end
else if(data = $03) then
begin
Shape1.Brush.Color:=clGreen;
Shape3.Brush.Color:=clBlack;
Shape4.Brush.Color:=clBlack;
end
else if(data = $04) then
begin
TimeSeparator:=':';
DateSeparator:='-';
waktu :=TimeToStr(time);
tanggal:=datetostr(now);
//image2.Picture.SaveToFile('D:\test\'+tanggal+'.jpg');
samplegrabber1.GetBitmap(Image1.Picture.Bitmap);
image2.Picture :=image1.picture;
Stream:=TMemorystream.Create;
Image1.Picture.Graphic.SaveToStream(stream);
Stream.Position:=0;
Adoquery1.Append;
Adoquery1.FieldByName('waktu').AsString:=waktu;
Adoquery1.FieldByName('tanggal').AsString:=tanggal;
Tblobfield(Adoquery1.FieldByName('foto')).LoadFromStream(stream);
Stream.Free;
Adoquery1.Post;
Timer1.Enabled:=True;
end

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
comport1.Close;
shape2.Brush.Color:=clRed;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
application.Terminate;
end;

end.

