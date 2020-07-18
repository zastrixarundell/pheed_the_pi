from PIL import Image
import io
import time

def compress_image(image_binary):
    now = int(round(time.time() * 1000))
    image = Image.open(io.BytesIO(image_binary))
    image.convert(mode = 'P', colors = 8)
    output = io.BytesIO()
    image.save(output, format='JPEG')
    end = int(round(time.time() * 1000))
    print('Took: ' + str(end - now) + ' millisecconds')
    return output.getvalue()