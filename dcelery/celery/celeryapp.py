

from celery import Celery


app = Celery("celery") # Organizing and managi ng multiple celery applications within the project by putting a different instance name here.

app.config_from_object("config", namespace="CELERY")