import mysql.connector

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
        query = "SELECT * FROM {}".format(table)
        cursor.execute(query)
        registros = cursor.fetchall()

        print(registros)

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
        resposta = cursor.fetchall()

        print(resposta)

    except:
        print("Não encontrei esse registro")

    finally:
        cursor.close()