import mysql.connector
import tkinter as tk
from tkinter import ttk, messagebox
import ui

def conexao_banco():
    try:
        cnx = mysql.connector.connect(
            host = 'localhost',
            user = 'root',
            password = '',
            database = 'banco'

        )
        return cnx
        #  print("Deu certo a conexao")
    except:
        print("Deu errado a conexão")


def buscarTodos(table):
    try:
        conexao = conexao_banco()
        cursor = conexao.cursor()
        query = "SELECT id,nome,endereco FROM {}".format(table)
        cursor.execute(query)
        registros = cursor.fetchall()

        print(registros)

        return registros

        # descricao = "\n".join(registro[0] for registro in registros)

    except:
        print('Não foi possivel selecionar todo o banco!')

    finally:
        cursor.close()


def buscarClienteNome(nome):

    try:
        conexao = conexao_banco()
        cursor = conexao.cursor()
        query = "SELECT * FROM cliente WHERE nome LIKE '%{}%'".format(nome)
        cursor.execute(query)
        registros = cursor.fetchall()

        resposta = []
        for row in registros:
            resposta = [{"id":row[0],"nome":row[1],"endereco":row[2],"telefone":row[3],"email":row[4],}]

        return resposta

    except:
        print("Não encontrei esse registro")

    finally:
        cursor.close()


def buscarClienteId(idCliente):
    try:
        conexao = conexao_banco()
        cursor = conexao.cursor()

        query = " SELECT * FROM cliente WHERE id = {}".format(idCliente)
        cursor.execute(query)
        resultado = cursor.fetchone()

        if resultado:
            return{
                "id" : resultado[0],
                "nome" : resultado[1],
                "endereco" : resultado[2],
                "telefone" : resultado[3],
                "email" : resultado[4]
            }
    except:
        messagebox.showerror("--- ALERTA --- ","Não foi possivel acessar esse registro")

def cadastraCliente(nome,endereco,telefone,email):
    
    try:
        conexao = conexao_banco()
        cursor = conexao.cursor()

        query = "INSERT INTO cliente(nome,endereco,telefone,email) values (%s, %s, %s, %s)"

        # print(nome)
        # print(endereco)
        # print(telefone)
        # print(email)
        cursor.execute(query, (nome, endereco, telefone, email))

        
        conexao.commit()

        messagebox.showwarning("Cadastro", "Cliente cadastrado com sucesso")
    except:
        messagebox.showerror("Erro", "Não possivel realizar o cadastro")


def excluirProduto(clienteId):
    try:
        conexao = conexao_banco()
        cursor = conexao.cursor()

        query = "DELETE FROM cliente WHERE id = {}".format(clienteId)

        cursor.execute(query)
        conexao.commit()

        messagebox.showinfo("AVISO", "Registro deletado")

    except:
        messagebox.showerror("Erro","Nao foi possivel excluir o cliente")


def atualizarCliente(clienteId, nome, endereco, telefone, email, novaJanela):
    try:
        conexao = conexao_banco()
        cursor = conexao.cursor()

        query = """ UPDATE cliente 
        SET nome = '{}', endereco = '{}', telefone = '{}', email = '{}' 
        WHERE id = '{}' """.format( nome, endereco, telefone, email, clienteId )

        print(query)

        cursor.execute(query)
        conexao.commit()
        novaJanela.destroy()

        messagebox.showinfo("AVISO", "Produto atualizado")
    except:
        messagebox.showerror("AVISO", "Nao foi possivel atualizar esse cliente")



