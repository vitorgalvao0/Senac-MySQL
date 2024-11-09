import tkinter as tk
import database as db
from tkinter import ttk

# Nova janela
def listagemRegistro():
    novaJanela = tk.Toplevel()
    novaJanela.title("Listagem dos registro")
    novaJanela.geometry("600x600")

    # Titulo da janela
    labelTitulo = tk.Label(novaJanela, text="Listar nomes")
    labelTitulo.pack(pady=10)


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
    btnListaNomes = tk.Button(novaJanela, text="Listar produtos", command=lambda:carregarNomes())
    btnListaNomes.pack(pady=10)

    # Carregar os nomes dos clientes
    def carregarNomes():
        registros = db.buscarTodos("cliente")
        for registro in registros:
            tabelaNomes.insert("",tk.END,values=registro)















    # btnFechar = tk.Button(novaJanela, text="Fechar", command=novaJanela.destroy)
    # btnFechar.pack(pady=10)



def telaPrincipal():
    root = tk.Tk()
    root.title("Banco Gr's")
    root.geometry("500x500")
    
     
    # Mostra todos os nomes da tabela
    registro_texto = tk.Label(root, text="", justify="left", anchor="center")
    registro_texto.pack()

    def atualizar_registro():
        registro = db.buscarTodos("cliente")
        registro_texto.config(text=registro)

    btnListarTodos = tk.Button(root, text="Listar todos", command=lambda:atualizar_registro())
    btnListarTodos.pack(pady=10)

    btnListagemRegistro = tk.Button(root, text="Abrir lista dos clientes", command=listagemRegistro())
    btnListagemRegistro.pack(pady=10)

    # Mostra todos os nomes da tabela
    registro_texto = tk.Label(root, text="", justify="left", anchor="center")
    registro_texto.pack()



    root.mainloop()