unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  LCLIntf, LCLType, Menus, ComCtrls, Spin, Buttons, Unit2, Unit3;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    OpenDialog1: TOpenDialog;
    ProgramTitle: TLabel;
    SaveDialog1: TSaveDialog;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    procedure AboutAuthor(Sender: TObject);
    procedure AboutMenuProgram(Sender: TObject);
    procedure CloseProgramMenu(Sender: TObject);
    procedure CollorBucket(Sender: TObject);
    procedure FailProgBarChange(Sender: TObject);
    procedure FailProgSpinChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LoadMenuClick(Sender: TObject);
    procedure PauseButtonClick(Sender: TObject);
    procedure SaveMenuClick(Sender: TObject);
    procedure SpeedProgBarChange(Sender: TObject);
    procedure SpeedProgSpinChange(Sender: TObject);
    procedure StartButtonClick(Sender: TObject);
    procedure WaterBucket(Sender: TObject);
  private
    procedure UpdateValueSpeed(NewValSpeedP: Integer);
    procedure UpdateValueFail(NewValFailF: Integer);
    procedure SaveBucketsToFile(const FileName: string);
    procedure LoadBucketsFromFile(const FileName: string);
  public
    procedure UpdateBucketImages;
    procedure WaterLevelLabels;
  end;

type
  TBucket = record
    ColorIndex: Integer;  // Индекс цвета (0-16)
    WaterLevel: Integer;  // Уровень воды (0-10 литров)
  end;

var
  Form1: TForm1;
  Buckets: array[1..10] of TBucket;
  DefaultBuckets: array[1..10] of TBucket;

  GameBuckets: array[1..10] of TBucket;


  BucketEmptyImages: array[0..16] of string;  // Массив изображений пустых ведер
  BucketFilledImages: array[0..16] of string; // Массив изображений вёдер с водой
  SpeedValueP: Integer;
  FailValueF: Integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure InitializeBucketImages;
begin
  BucketEmptyImages[0] := 'empty_metall.png';  // пустое ведро без цвета
  BucketFilledImages[0] := 'full_metal.png';  // ведро с водой без цвета
  BucketEmptyImages[1] := 'empty_black.png';
  BucketFilledImages[1] := 'full_black.png';
  BucketEmptyImages[2] := 'empty_blue.png';
  BucketFilledImages[2] := 'full_blue.png';
  BucketEmptyImages[3] := 'empty_cian.png';
  BucketFilledImages[3] := 'full_cian.png';
  BucketEmptyImages[4] := 'empty_darkred.png';
  BucketFilledImages[4] := 'full_darkred.png';
  BucketEmptyImages[5] := 'empty_darkyellow.png';
  BucketFilledImages[5] := 'full_darkyellow.png';
  BucketEmptyImages[6] := 'empty_green.png';
  BucketFilledImages[6] := 'full_green.png';
  BucketEmptyImages[7] := 'empty_grey.png';
  BucketFilledImages[7] := 'full_grey.png';
  BucketEmptyImages[8] := 'empty_lightblue.png';
  BucketFilledImages[8] := 'full_lightblue.png';
  BucketEmptyImages[9] := 'empty_lightbrown.png';
  BucketFilledImages[9] := 'full_lightbrown.png';
  BucketEmptyImages[10] := 'empty_lightpink.png';
  BucketFilledImages[10] := 'full_lightpink.png';
  BucketEmptyImages[11] := 'empty_lightpurple.png';
  BucketFilledImages[11] := 'full_lightpurple.png';
  BucketEmptyImages[12] := 'empty_lightyellow.png';
  BucketFilledImages[12] := 'full_lightyellow.png';
  BucketEmptyImages[13] := 'empty_navyblue.png';
  BucketFilledImages[13] := 'full_navyblue.png';
  BucketEmptyImages[14] := 'empty_purple.png';
  BucketFilledImages[14] := 'full_purple.png';
  BucketEmptyImages[15] := 'empty_red.png';
  BucketFilledImages[15] := 'full_red.png';
  BucketEmptyImages[16] := 'empty_yellow.png';
  BucketFilledImages[16] := 'full_yellow.png';
end;

procedure LoadBucketImage(BucketIndex: Integer; ImageControl: TImage);
var
  ImagePath: string;
begin
  if Buckets[BucketIndex].WaterLevel = 0 then
    ImagePath := BucketEmptyImages[Buckets[BucketIndex].ColorIndex]
  else
    ImagePath := BucketFilledImages[Buckets[BucketIndex].ColorIndex];
  ImageControl.Picture.LoadFromFile(ImagePath);
end;

procedure TForm1.WaterLevelLabels;
begin
  // текст для каждого текста на основе уровня воды в соответствующем ведре
  Label1.Caption := IntToStr(Buckets[1].WaterLevel) + '/10';
  Label14.Caption := IntToStr(Buckets[2].WaterLevel) + '/10';
  Label15.Caption := IntToStr(Buckets[3].WaterLevel) + '/10';
  Label16.Caption := IntToStr(Buckets[4].WaterLevel) + '/10';
  Label17.Caption := IntToStr(Buckets[5].WaterLevel) + '/10';
  Label18.Caption := IntToStr(Buckets[6].WaterLevel) + '/10';
  Label19.Caption := IntToStr(Buckets[7].WaterLevel) + '/10';
  Label20.Caption := IntToStr(Buckets[8].WaterLevel) + '/10';
  Label21.Caption := IntToStr(Buckets[9].WaterLevel) + '/10';
  Label22.Caption := IntToStr(Buckets[10].WaterLevel) + '/10';
end;



procedure TForm1.FormCreate(Sender: TObject);
begin

  InitializeBucketImages;

  // выбор предустановленных состояний вёдер
  DefaultBuckets[1].ColorIndex := 1;
  DefaultBuckets[1].WaterLevel := 0;   // ведро 1
  DefaultBuckets[2].ColorIndex := 2;
  DefaultBuckets[2].WaterLevel := 1;
  DefaultBuckets[3].ColorIndex := 3;
  DefaultBuckets[3].WaterLevel := 2;
  DefaultBuckets[4].ColorIndex := 4;
  DefaultBuckets[4].WaterLevel := 3;
  DefaultBuckets[5].ColorIndex := 5;
  DefaultBuckets[5].WaterLevel := 4;
  DefaultBuckets[6].ColorIndex := 6;
  DefaultBuckets[6].WaterLevel := 5;
  DefaultBuckets[7].ColorIndex := 7;
  DefaultBuckets[7].WaterLevel := 0;
  DefaultBuckets[8].ColorIndex := 8;
  DefaultBuckets[8].WaterLevel := 6;
  DefaultBuckets[9].ColorIndex := 9;
  DefaultBuckets[9].WaterLevel := 8;
  DefaultBuckets[10].ColorIndex := 10;
  DefaultBuckets[10].WaterLevel := 0;


  Buckets := DefaultBuckets;

  WaterLevelLabels;

  LoadBucketImage(1, Image1);
  LoadBucketImage(2, Image2);
  LoadBucketImage(3, Image3);
  LoadBucketImage(4, Image4);
  LoadBucketImage(5, Image5);
  LoadBucketImage(6, Image6);
  LoadBucketImage(7, Image7);
  LoadBucketImage(8, Image8);
  LoadBucketImage(9, Image9);
  LoadBucketImage(10, Image10);

  ProgramTitle.Left := (Self.ClientWidth - ProgramTitle.Width) div 2;
end;

procedure TForm1.LoadMenuClick(Sender: TObject);
begin
  // фильтр для файлов
  OpenDialog1.Filter := 'Save files (*.save)|*.save|All files (*.*)|*.*';

  if OpenDialog1.Execute then
  begin
    LoadBucketsFromFile(OpenDialog1.FileName);
  end;
end;


procedure TForm1.LoadBucketsFromFile(const FileName: string);
var
  LoadFile: TextFile;
  Line: string;
  BucketIndex, Value: Integer;
begin
  AssignFile(LoadFile, FileName);
  Reset(LoadFile);

  try
    for BucketIndex := 1 to 10 do  // Итерирация по ведрам (от 1 до 10)
    begin
      // строка с цветом
      Readln(LoadFile, Line);
      if Pos('Color=', Line) > 0 then
      begin
        Value := StrToIntDef(Copy(Line, Pos('=', Line) + 2, MaxInt), 0);
        DefaultBuckets[BucketIndex].ColorIndex := Value;
      end;

      // строка с уровнем воды
      Readln(LoadFile, Line);
      if Pos('Water=', Line) > 0 then
      begin
        Value := StrToIntDef(Copy(Line, Pos('=', Line) + 2, MaxInt), 0);
        DefaultBuckets[BucketIndex].WaterLevel := Value;
      end;
    end;
  finally
    CloseFile(LoadFile);
  end;

  Buckets := DefaultBuckets;

  UpdateBucketImages;
  WaterLevelLabels;
  MessageDlg('Загрузка файла', 'Состояние вёдер успешно загружено!', mtInformation, [mbOK], 0);
end;



procedure TForm1.PauseButtonClick(Sender: TObject);
begin
  if Button3.Caption = 'Пауза' then
  begin
    Button3.Caption := 'Продолжить';
  end
  else
  begin
    Button3.Caption := 'Пауза';
  end;
end;

procedure TForm1.SaveBucketsToFile(const FileName: string);
var
  SaveFile: TextFile;
  i: Integer;
begin
  AssignFile(SaveFile, FileName);
  Rewrite(SaveFile);

  try
    for i := 1 to 10 do
    begin
      Writeln(SaveFile, 'Bucket[' + IntToStr(i) + '].Color= ' + IntToStr(Buckets[i].ColorIndex));
      Writeln(SaveFile, 'Bucket[' + IntToStr(i) + '].Water= ' + IntToStr(Buckets[i].WaterLevel));
    end;
  finally
    CloseFile(SaveFile);
  end;

  MessageDlg('Сохранение файла', 'Состояние вёдер успешно сохранено!', mtInformation, [mbOK], 0);
end;

procedure TForm1.SaveMenuClick(Sender: TObject);
begin
  // фильтр для файлов
  SaveDialog1.Filter := 'Save files (*.save)|*.save|All files (*.*)|*.*';

  if SaveDialog1.Execute then
  begin
    SaveBucketsToFile(SaveDialog1.FileName);
  end;
end;





////////////
procedure TForm1.SpeedProgBarChange(Sender: TObject);
begin
    UpdateValueSpeed(TrackBar1.Position);
end;

procedure TForm1.SpeedProgSpinChange(Sender: TObject);
begin
    UpdateValueSpeed(SpinEdit1.Value);
end;

procedure TForm1.StartButtonClick(Sender: TObject);
begin
  if Button2.Caption = 'Старт' then
  begin
    Button2.Caption := 'Стоп';
    MenuItem8.Enabled := False;
    MenuItem9.Enabled := False;
    MenuItem5.Enabled := False;
    MenuItem6.Enabled := False;
    MenuItem3.Enabled := False;
    GameBuckets := Buckets;
  end
  else
  begin
    Button2.Caption := 'Старт';
    MenuItem8.Enabled := True;
    MenuItem9.Enabled := True;
    MenuItem5.Enabled := True;
    MenuItem6.Enabled := True;
    MenuItem3.Enabled := True;
  end;
end;


procedure TForm1.UpdateValueSpeed(NewValSpeedP: Integer);
begin
  if TrackBar1.Position <> NewValSpeedP then
    TrackBar1.Position := NewValSpeedP;

  if SpinEdit1.Value <> NewValSpeedP then
    SpinEdit1.Value := NewValSpeedP;

  SpeedValueP := NewValSpeedP;
end;
/////////////

/////////////////////////
procedure TForm1.FailProgBarChange(Sender: TObject);
begin
     UpdateValueFail(TrackBar2.Position);
end;

procedure TForm1.FailProgSpinChange(Sender: TObject);
begin
     UpdateValueFail(SpinEdit2.Value)
end;

procedure TForm1.UpdateValueFail(NewValFailF: Integer);
begin
  if TrackBar2.Position <> NewValFailF then
    TrackBar2.Position := NewValFailF;

  if SpinEdit2.Value <> NewValFailF then
    SpinEdit2.Value := NewValFailF;

  FailValueF := NewValFailF;
end;
/////////////////////////





procedure TForm1.WaterBucket(Sender: TObject);
begin
     FillBucketWindow := TFillBucketWindow.Create(Self);
     FillBucketWindow.ShowModal;
     FillBucketWindow.Free;
end;

procedure TForm1.CloseProgramMenu(Sender: TObject);
begin
     Close;
end;

procedure TForm1.CollorBucket(Sender: TObject);
begin
     CollorBucketWindows := TCollorBucketWindows.Create(Self);
     CollorBucketWindows.ShowModal;
     CollorBucketWindows.Free;
end;

procedure TForm1.UpdateBucketImages;
var
  i: Integer;
  ImageControl: TImage;
begin
  for i := 1 to 10 do
  begin
    // Ищем компонент по имени
    ImageControl := TImage(FindComponent('Image' + IntToStr(i)));
    if Assigned(ImageControl) then
      LoadBucketImage(i, ImageControl);  // Обновляем изображение ведра
  end;
end;


procedure TForm1.AboutMenuProgram(Sender: TObject);
begin
    MessageDlg('О программе', 'Buckets' + LineEnding +
                'Версия: 1.0' + LineEnding +
                'Программа для покраски и' + LineEnding +
                'наполнения вёдер в различных' + LineEnding +
                'режимах.', mtInformation, [mbOK], 0);
end;

procedure TForm1.AboutAuthor(Sender: TObject);
begin
    MessageDlg('Об авторе', 'Автор: Slavor' + LineEnding +
                '© 2024', mtCustom, [mbOK], 0);
end;

end.

