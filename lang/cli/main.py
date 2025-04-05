import typer
import os
import subprocess as sb
import json

from rich import print
from rich.console import Console

app = typer.Typer()
console = Console()
file = input()

def ParseJson(self):
    pass

def ParseMml(self):
    pass

def ParseFlameFile(self):
    pass

def ParseFlm(self):
    pass

@app.command()
def run(name, file):
    print(f"[magenta]FluidScripten v0.1.1[/magenta]")
    print(f"[green]Task:[/green] run {file}")
    if(file.Ext == '.json'):
        ParseJson(file)
    elif(file.Ext == '.mml'):
        ParseMml(file)
    elif(file.Ext == '.flame'):
        ParseFlameFile(file)
    elif(file.Ext == '.flm'):
        ParseFlm(file)
    else:
        print(f"[red][bold]Invalid file type {file.Ext}[/bold][/red]")
        exit(1)
        
    

if __name__ == "__main__":
    app()