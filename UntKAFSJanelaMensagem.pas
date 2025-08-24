unit UntKAFSJanelaMensagem;

interface

uses
  System.Classes, System.UITypes, System.SysUtils,
  FMX.StdCtrls, FMX.Types,
  UntKAFSJanelaModal;

type
  TKAFSJanelaMensagem = class(TKAFSJanelaModal)
    LabDescricao: TLabel;
  public
    Confirmar: TNotifyEvent;

    constructor Create(AOwner: TComponent); override;
    procedure KAFSJanelaMensagemConfig(const _cortema1, _cortema2: TAlphaColor; _titulo, _descricao, _botaoconfirmar: String; _confirmar: TNotifyEvent);
    procedure Confirmando(Sender: TObject);
    procedure Sair(Sender: TObject);
    destructor Destroy; override;
  end;

implementation

constructor TKAFSJanelaMensagem.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  LabDescricao := TLabel.Create(Self);
  with LabDescricao do
  begin
    Align := TAlignLayout.Client;
    Font.Family := 'Segoe UI Emoji';
    Font.Size := 24;
    Font.Style := [];
    Parent := Self;
    StyledSettings := [];
    TextSettings.HorzAlign := TTextAlign.Center;
  end;
end;

procedure TKAFSJanelaMensagem.KAFSJanelaMensagemConfig(const _cortema1, _cortema2: TAlphaColor; _titulo, _descricao, _botaoconfirmar: String; _confirmar: TNotifyEvent);
begin
  // Configura cores e textos da tela padrão
  KAFSJanelaModalConfig(_cortema1, _cortema2, _titulo, _botaoconfirmar);

  with LabDescricao do
  begin
    FontColor := _cortema1;
    Text := _descricao;
  end;

  TThread.Synchronize(nil, procedure begin Visible := True; end);

  // Associa procedures aos botões
  BtnVoltar.OnClick := Sair;
  BtnConfirmar.OnClick := Confirmando;

  // Assonia o evento que será executado depois da confirmação
  Confirmar := _confirmar;
end;

procedure TKAFSJanelaMensagem.Confirmando(Sender: TObject);
begin
  Confirmar(nil);

  Free;
end;

procedure TKAFSJanelaMensagem.Sair(Sender: TObject);
begin
  Free;
end;

destructor TKAFSJanelaMensagem.Destroy;
begin
  if Assigned(LabDescricao) then
    FreeAndNil(LabDescricao);

  inherited Destroy;
end;

end.
