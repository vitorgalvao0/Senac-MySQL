import mysql.connector
import tkinter as tk

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


def buscarClienteNome(tree, nome):
    try:
        conexao = conexao_banco()
        cursor = conexao.cursor()
        query = "SELECT * FROM cliente WHERE nome LIKE '%{}%'".format(nome)
        cursor.execute(query)
        resposta = cursor.fetchall()


        for registro in registro:
            tree.insert("",tk.END, values=registro)

        return resposta

    except:
        print("Não encontrei esse registro")

    finally:
        cursor.close()