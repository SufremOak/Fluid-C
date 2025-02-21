import typer
from rich.console import Console
from LibCompiler import GCCCompiler

app = typer.Typer()
console = Console()

@app.command()
def compile(
    source: str = typer.Argument(..., help="The source file to compile"),
    output: str = typer.Option("a.out", "-o", "--output", help="The output executable name"),
    compiler: str = typer.Option("g++", "-c", "--compiler", help="The compiler to use"),
    flags: str = typer.Option("", "-f", "--flags", help="Additional compiler flags")
):
    compile_command = f"{compiler} {source} -o {output} {flags}"
    compiler_instance = GCCCompiler(compile_command)
    result = compiler_instance.compile()

    if result == 0:
        console.print("[bold green]Compilation successful[/bold green]")
    else:
        console.print("[bold red]Compilation failed[/bold red]")

if __name__ == "__main__":
    app()