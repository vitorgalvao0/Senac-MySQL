import tkinter as tk
import database as db

def telaPrincipal():
    root = tk.Tk()
    root.title("Banco Gr's")
    root.geometry("500x500")
    
    tk.Button(root,text="Imprimir Cliente", width=30, command=lambda:db.buscarTodos("cliente")).pack(pady=10)

    tk.Label(root, text="Nome cliente",width=50).pack()

    inputCliente = tk.Entry(root) # A entrada precisa ser associada ao widget 'root'
    inputCliente.pack()

    tk.Button(root,text="Imprimir nome", width=30, command=lambda: db.buscarClienteNome(inputCliente.get())).pack(pady=10)



    root.mainloop()