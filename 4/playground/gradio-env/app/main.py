import gradio as gr

def greet(name, name2, intensity):
    return "Hello, " + name +" "+ name2 + "!" * int(intensity)

demo = gr.Interface(
    fn=greet,   # takes reference to a function
    inputs=["text", "text", "slider"],  # list of input components used by function passed to fn. text -> gr.Textbox, slider -> gr.Slider
    outputs=["text"],   # contain data returned by function passed to fn in return stmt gr.Textbox
)

demo.launch()
