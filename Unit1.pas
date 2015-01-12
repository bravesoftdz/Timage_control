unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, System.Actions, FMX.ActnList, FMX.Gestures, FMX.Filter.Effects,
  FMX.Media;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ImageControl1: TImageControl;
    ShadowEffect1: TShadowEffect;
    Button4: TButton;
    GestureManager1: TGestureManager;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    MediaPlayer1: TMediaPlayer;
    GaussianBlurEffect1: TGaussianBlurEffect;
    TrackBar1: TTrackBar;
    GlowEffect1: TGlowEffect;
    procedure Button3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  s: array [0..3] of string;

implementation

{$R *.fmx}
{$R *.iPhone4in.fmx IOS}

procedure TForm1.FormActivate(Sender: TObject);
begin
 s[0]:='1';
 s[1]:='http://www.google.ru/images/icons/product/chrome-48.png';
 s[2]:='http://startandroid.ru/images/stories/lessons/L0003/L0003_020.png';
 s[3]:='http://adv.kaztrk.kz/images/24fcb31240b39083b2622d6ff6e13b09.jpg';

end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  GaussianBlurEffect1.BlurAmount:= TrackBar1.Value / 100;
end;

procedure LoadWebImage(url: string; image :TBitmap);
var
  idhttp : TIdHTTP;
  ms : TMemoryStream;
begin
  IdHTTP := TIdHTTP.Create(nil);
  ms := TMemoryStream.Create;
  try
    idhttp.Get(url, ms);
    ms.Position := 0;
    image.LoadFromStream(ms);
  finally
    ms.Free;
    idhttp.Free;
  end;
end;

procedure TForm1.Action1Execute(Sender: TObject);
var
  i:integer;
begin
 i:=strtoint(s[0]);
  LoadWebImage(s[i],ImageControl1.Bitmap );
  imagecontrol1.Bitmap.Resize(320,460);
  if s[0]='1' then s[0]:='3' else
  if s[0]='2' then s[0]:='1' else
  if s[0]='3' then s[0]:='2';
end;

procedure TForm1.Action2Execute(Sender: TObject);
 var
  i:integer;
begin

//  Imagecontrol1.Bitmap.Create;
  i:=strtoint(s[0]);
  LoadWebImage(s[i],ImageControl1.Bitmap );
  imagecontrol1.Bitmap.Resize(320,460);
  if s[0]='1' then s[0]:='2' else
  if s[0]='2' then s[0]:='3' else
  if s[0]='3' then s[0]:='1';
//  ImageControl1.Bitmap.Resize(Imagecontrol1.Width,);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i:integer;
begin
 i:=strtoint(s[0]);
  LoadWebImage(s[i],ImageControl1.Bitmap );
  imagecontrol1.Bitmap.Resize(320,460);
  if s[0]='1' then s[0]:='3' else
  if s[0]='2' then s[0]:='1' else
  if s[0]='3' then s[0]:='2';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
mediaplayer1.Media.Disposed
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  i:integer;
begin

//  Imagecontrol1.Bitmap.Create;
  i:=strtoint(s[0]);
  LoadWebImage(s[i],ImageControl1.Bitmap );
  imagecontrol1.Bitmap.Resize(320,460);
  if s[0]='1' then s[0]:='2' else
  if s[0]='2' then s[0]:='3' else
  if s[0]='3' then s[0]:='1';
//  ImageControl1.Bitmap.Resize(Imagecontrol1.Width,);
end;




procedure TForm1.Button4Click(Sender: TObject);
begin
GaussianBlurEffect1.BlurAmount:= TrackBar1.Value / 100;
if GaussianBlurEffect1.Enabled then
  GaussianBlurEffect1.Enabled:=false else
  GaussianBlurEffect1.Enabled:=true;

end;

end.
