unit uKAFSJanelaMensagem;

interface

uses
  System.Classes, System.UITypes,
  FMX.Graphics, FMX.StdCtrls, FMX.Types,
  uKAFSJanelaModal;

type
  TKAFSJanelaMensagem = class(TKAFSJanelaModal)
    labDescricao: TLabel;
  public
    Confirmar: TNotifyEvent;

    constructor Create(AOwner: TComponent); reintroduce;
    procedure KAFSJanelaMensagemConfig(const _cortema1, _cortema2: TAlphaColor; const _imgLogo: TBitmap; const _titulo, _descricao, _txtbotao: String; const _confirmar: TNotifyEvent);
    procedure Confirmando(Sender: TObject);
    procedure Sair(Sender: TObject);
    destructor Destroy; override;
  end;

implementation

constructor TKAFSJanelaMensagem.Create(AOwner: TComponent);
begin
  TThread.Synchronize(nil, procedure
  begin
    inherited Create(AOwner);

    labDescricao := TLabel.Create(Self);
    labDescricao.Align := TAlignLayout.Client;
    labDescricao.Font.Family := 'Segoe UI Emoji';
    labDescricao.Font.Size := 20;
    labDescricao.Font.Style := [];
    labDescricao.Parent := Self;
    labDescricao.StyledSettings := [];
    labDescricao.TextSettings.HorzAlign := TTextAlign.Center;
  end);
end;

procedure TKAFSJanelaMensagem.KAFSJanelaMensagemConfig(const _cortema1, _cortema2: TAlphaColor; const _imgLogo: TBitmap; const _titulo, _descricao, _txtbotao: String; const _confirmar: TNotifyEvent);
begin
  KAFSJanelaModalConfig(_cortema1, _cortema2, _imgLogo, _titulo, _txtbotao);

  TThread.Synchronize(nil, procedure
  begin
    // Configura componentes
    btnVoltar.btnBotao.OnClick := Sair;

    labDescricao.Text := _descricao;
    labDescricao.TextSettings.FontColor := _cortema1;

    btnConfirmar.btnBotao.OnClick := Confirmando;

    Confirmar := _confirmar;

    Self.Visible := True;
    Self.BringToFront;
  end);
end;

procedure TKAFSJanelaMensagem.Confirmando(Sender: TObject);
begin
  Confirmar(Sender);
  Sair(Sender);
end;

procedure TKAFSJanelaMensagem.Sair(Sender: TObject);
begin
  TThread.Synchronize(nil, procedure begin Self.Free; end);
end;

destructor TKAFSJanelaMensagem.Destroy;
begin

  inherited Destroy;
end;

end.
