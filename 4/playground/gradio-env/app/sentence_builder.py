import gradio as gr

def sentence_builder(quantity, animal, countries, place, morning):
    return f"""The {quantity} {animal}s from {" and ".join(countries)} went to the {place} in the {"morning" if morning else "night"}"""

with gr.Blocks() as demo:

    gr.Markdown("Choose the options and then click **Run** to see the output.")
    with gr.Row():
        quantity = gr.Slider(2, 20, value=4, label="Count", info="Choose between 2 and 20")
        animal = gr.Dropdown(["cat", "dog", "bird"], label="Animal", info="Will add more animals later!")
        countries = gr.CheckboxGroup(["USA", "Japan", "Pakistan"], label="Countries", info="Where are they from?")
        place = gr.Radio(["park", "zoo", "road"], label="Location", info="Where did they go?")
        morning = gr.Checkbox(label="Morning", info="Did they do it in the morning?")

    btn = gr.Button("Run")
    btn.click(
        fn=sentence_builder,
        inputs=[quantity, animal, countries, place, morning],
        outputs=gr.Textbox(label="Output")
    )

if __name__ == "__main__":
    demo.launch(debug=True)