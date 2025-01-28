import tkinter as tk
import database as db
from tkinter import ttk, messagebox
from PIL import Image, ImageTk

# Nova janela
def listagemRegistro():
    novaJanela = tk.Toplevel()
    novaJanela.title("Listagem dos registro")
    novaJanela.geometry("600x600")

    # Titulo da janela
    labelTitulo = tk.Label(novaJanela, text="Listar nomes")
    labelTitulo.pack(pady=10)

    def aplicar_filtro():
        for item in tabelaNomes.get_children():
            tabelaNomes.delete(item)
 
        registros_filtro = db.buscarClienteNome(entryNome.get())

        for registro in registros_filtro:
            tabelaNomes.insert("", "end", values=(
                registro.get("id", ""),
                registro.get("nome", ""),
                registro.get("endereco", ""),
                registro.get("telefone", ""),
                registro.get("email", "")
            ))
 
    # LABEL PARA PROCURAR LIVRO
    tk.Label(novaJanela, text="Procurar").pack(pady=10)
    # INPUT - CAIXA DE PERGUNTA
    entryNome = tk.Entry(novaJanela, width=50)
    entryNome.pack(pady=10)
    # BTN PARA PROCURAR
    btnProcura = tk.Button(novaJanela, text="Filtrar", command=lambda:aplicar_filtro())
    btnProcura.pack(pady=10)

    # Formatação do cabeçalho
    colunas = ("ID","Nome","Endereço")
    tabelaNomes = ttk.Treeview(novaJanela, columns=colunas, show="headings")
    tabelaNomes.pack(fill="both")

    # Configura o cabeçalho da coluna
    tabelaNomes.heading("ID", text="ID")
    tabelaNomes.heading("Nome", text="Nome")
    tabelaNomes.heading("Endereço", text="Endereço")

    # Especificar tamanho da colunas
    tabelaNomes.column("ID",width=50)
    tabelaNomes.column("Nome",width=200)
    tabelaNomes.column("Endereço",width=250)


    # Criar botao
    btnListaNomes = tk.Button(novaJanela, text="Liste os nomes", command=lambda:carregarNomes())
    btnListaNomes.pack(pady=10)


    # Carregar os nomes dos clientes
    def carregarNomes():
        registros = db.buscarTodos("cliente")
        for registro in registros:
            tabelaNomes.insert("",tk.END,values=registro)


    def excluirRegistro():
        selectedItem = tabelaNomes.selection()

        if selectedItem:
            item = tabelaNomes.item(selectedItem)

            clienteId = item["values"][0]

            db.excluirProduto(clienteId)
            novaJanela.destroy()


    def editarRegistro():
        selectedItem = tabelaNomes.selection()

        if selectedItem:
            item = tabelaNomes.item(selectedItem)

            clienteId = item["values"][0]
            janelaAtualizaRegistro(clienteId)


    btnAtualiza = tk.Button(novaJanela,text="Atualizar Registro", command=editarRegistro)
    btnAtualiza.pack(pady=10)

    btnDelete = tk.Button(novaJanela,text="Deletar cliente", command=excluirRegistro)
    btnDelete.pack(pady=10)

def janelaCadastraNome():

    # Metodo que limpa os campos 
    def limpaCampo():
        inputNome.delete(0,tk.END)
        inputEmail.delete(0,tk.END)
        inputEndereco.delete(0,tk.END)
        inputTelefone.delete(0,tk.END)

    # Metodo que salva produto no banco e limpa
    def salvaCliente():
        db.cadastraCliente(
            inputNome.get(), 
            inputEndereco.get(), 
            inputTelefone.get(), 
            inputEmail.get()
            )
        limpaCampo()
      
    novaJanela = tk.Toplevel()
    novaJanela.title("Cadastro de clientes")
    novaJanela.geometry("400x600")

    # Label e input para nome
    labelNome = tk.Label(novaJanela, text="Nome")
    labelNome.pack(pady=1)
    inputNome = tk.Entry(novaJanela)
    inputNome.pack(pady=10)

    # Label e input para endereço
    labelEndereco = tk.Label(novaJanela, text="Endereço")
    labelEndereco.pack(pady=1)
    inputEndereco = tk.Entry(novaJanela)
    inputEndereco.pack(pady=10)

    # Label e input para telefone
    labelTelefone = tk.Label(novaJanela, text="Telefone")
    labelTelefone.pack(pady=1)
    inputTelefone = tk.Entry(novaJanela)
    inputTelefone.pack(pady=10)

    # Label e input para email
    labelEmail = tk.Label(novaJanela, text="Email")
    labelEmail.pack(pady=1)
    inputEmail = tk.Entry(novaJanela)
    inputEmail.pack(pady=10)


    # Botão que vai cadastrar o nome e dados no banco de dados
    bntCadastraNome = tk.Button(novaJanela, text="Cadastrar", command=lambda:salvaCliente())
    bntCadastraNome.pack(pady=10)

def telaPrincipal():
    root = tk.Tk()
    root.title("Banco Gr's")
    root.geometry("500x500")
    
     
    # Mostra todos os nomes da tabela
    registro_texto = tk.Label(root, text="", justify="left", anchor="center")
    registro_texto.pack()

    btnListagemRegistro = tk.Button(root, text="Abrir lista dos clientes", command=lambda:listagemRegistro())
    btnListagemRegistro.pack(pady=10)


    btnJanelaCadastraNome = tk.Button(root, text="Cadastrar nome", command=lambda:janelaCadastraNome())
    btnJanelaCadastraNome.pack(pady=10)

    root.mainloop()

def janelaAtualizaRegistro(clienteId):
    lancamento = db.buscarClienteId(clienteId)

    novaJanela = tk.Toplevel()
    novaJanela.title("Atualizar Registro")
    novaJanela.geometry("600x600")

    tk.Label(novaJanela, text="Id do cliente").pack(pady=10)
    openId = tk.Entry(novaJanela)
    openId.insert(0, str(clienteId))
    openId.config(state="disabled")
    openId.pack(pady=10)

    tk.Label(novaJanela, text="Nome do cliente").pack(pady=10)
    openNome = tk.Entry(novaJanela)
    openNome.insert(0, str(lancamento.get('nome', '')))
    openNome.pack(pady=10)

    tk.Label(novaJanela, text="Endereço do cliente").pack(pady=10)
    openEndereco = tk.Entry(novaJanela)
    openEndereco.insert(0, str(lancamento.get('endereco', '')))
    openEndereco.pack(pady=10)

    tk.Label(novaJanela, text="Telefone do cliente").pack(pady=10)
    openTelefone = tk.Entry(novaJanela)
    openTelefone.insert(0, str(lancamento.get('telefone', '')))
    openTelefone.pack(pady=10)

    tk.Label(novaJanela, text="E-mail do cliente").pack(pady=10)
    openEmail = tk.Entry(novaJanela)
    openEmail.insert(0, str(lancamento.get('email', '')))
    openEmail.pack(pady=10)

    btnSalvarRegistro = tk.Button(novaJanela, text="Salvar a alterção", command=lambda:db.atualizarCliente(
        clienteId, openNome.get(), 
        openEndereco.get(), 
        openTelefone.get(), 
        openEmail.get(),
        novaJanela
        ))
    btnSalvarRegistro.pack(pady=10)
    