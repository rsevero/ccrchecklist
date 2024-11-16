import os

def replace_word_in_file(file_path, old_word, new_word):
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            content = file.read()

        updated_content = content.replace(old_word, new_word)

        with open(file_path, 'w', encoding='utf-8') as file:
            file.write(updated_content)

        print(f'Updated {file_path}')
    except (UnicodeDecodeError, UnicodeEncodeError):
        print(f'Skipped {file_path} (not a valid UTF-8 file)')

def replace_word_in_directory(directory, old_word, new_word):
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith('.py'):
                print(f'Skipped {file} (Python file)')
                continue
            file_path = os.path.join(root, file)
            replace_word_in_file(file_path, old_word, new_word)

if __name__ == "__main__":
    directory = os.getcwd()  # Get the current working directory
    old_word = 'ccr_checklist'     # Replace with the word you want to change
    new_word = 'ccrchecklist'     # Replace with the new word

    replace_word_in_directory(directory, old_word, new_word)
    print('Word replacement completed.')
