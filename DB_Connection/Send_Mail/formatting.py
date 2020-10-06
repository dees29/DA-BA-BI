msg_template="""Hello {name},
Would you like to join for a coffee.
happy to have you for that.
"""#.format(name="Deepu", website='cfe.sh')

def format_msg(my_name="Deepu", my_website='cfe.sh'):
    my_msg=msg_template.format(name=my_name, website=my_website)
    #print(my_msg)
    return my_msg
