unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  LCLIntf, LCLType, Menus, ComCtrls, Spin, Buttons, unit2, unit3;

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
    Label2: TLabel;
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
    ProgramTitle: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    procedure AboutAuthor(Sender: TObject);
    procedure AboutMenuProgram(Sender: TObject);
    procedure CloseProgramMenu(Sender: TObject);
    procedure CollorBucket(Sender: TObject);
    procedure FormCreate(Sender: TObject);  // Процедура для загрузки изображений при запуске формы
    procedure WaterBucket(Sender: TObject);
  private

  public

  end;

type
  // Структура для хранения состояния ведра
  TBucket = record
    ColorIndex: Integer;  // Индекс цвета (0-15)
    WaterLevel: Integer;  // Уровень воды (0-10 литров)
  end;

var
  Form1: TForm1;
  Buckets: array[1..10] of TBucket;  // Массив для 4 вёдер (можно расширить до 10 позже)

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  // Загрузка изображений пустых вёдер при запуске программы (по умолчанию)
  image1.Picture.LoadFromFile('empty_metall.png');
  Image2.Picture.LoadFromFile('empty_metall.png');
  Image3.Picture.LoadFromFile('empty_metall.png');
  image4.Picture.LoadFromFile('empty_metall.png');
  Image5.Picture.LoadFromFile('empty_metall.png');
  Image6.Picture.LoadFromFile('empty_metall.png');
  image7.Picture.LoadFromFile('empty_metall.png');
  Image8.Picture.LoadFromFile('empty_metall.png');
  Image9.Picture.LoadFromFile('empty_metall.png');
  Image10.Picture.LoadFromFile('empty_metall.png');

  // Инициализация состояния вёдер
  Buckets[1].ColorIndex := 0;  // Например, ведро 1 - цвет по умолчанию
  Buckets[1].WaterLevel := 0;  // Ведро пустое
  Buckets[2].ColorIndex := 0;
  Buckets[2].WaterLevel := 0;
  Buckets[3].ColorIndex := 0;
  Buckets[3].WaterLevel := 0;
  Buckets[4].ColorIndex := 0;
  Buckets[4].WaterLevel := 0;
  Buckets[5].ColorIndex := 0;
  Buckets[5].WaterLevel := 0;
  Buckets[6].ColorIndex := 0;
  Buckets[6].WaterLevel := 0;
  Buckets[7].ColorIndex := 0;
  Buckets[7].WaterLevel := 0;
  Buckets[8].ColorIndex := 0;
  Buckets[8].WaterLevel := 0;
  Buckets[9].ColorIndex := 0;
  Buckets[9].WaterLevel := 0;
  Buckets[10].ColorIndex := 0;
  Buckets[10].WaterLevel := 0;

  ProgramTitle.Left := (Self.ClientWidth - ProgramTitle.Width) div 2;
  ProgramTitle.Top := (Self.ClientHeight - ProgramTitle.Height) div 2;
  Label1.Left := (Self.ClientWidth - Label1.Width) div 2;
end;

procedure TForm1.WaterBucket(Sender: TObject);
begin
     FillBucketWindow := TFillBucketWindow.Create(Self);  // Создание второй формы
     FillBucketWindow.ShowModal;  // Показать вторую форму как модальную
     FillBucketWindow.Free;  // Освобождение памяти после закрытия формы
end;

procedure TForm1.CloseProgramMenu(Sender: TObject);
begin
     Close;
end;

procedure TForm1.CollorBucket(Sender: TObject);
begin
     CollorBucketWindows := TCollorBucketWindows.Create(Self);  // Создание второй формы
     CollorBucketWindows.ShowModal;  // Показать вторую форму как модальную
     CollorBucketWindows.Free;  // Освобождение памяти после закрытия формы
end;

procedure TForm1.AboutMenuProgram(Sender: TObject);
begin
    ShowMessage('Buckets' + LineEnding +
              'Версия: 1.0' + LineEnding +
              'Программа для покраски и' + LineEnding +
              'наполнения вёдер в различных' + LineEnding +
              'режимах.');
end;

procedure TForm1.AboutAuthor(Sender: TObject);
begin
    ShowMessage('Автор: Slavor' + LineEnding +
              '© 2024');
end;

end.

