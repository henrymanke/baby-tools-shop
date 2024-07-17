from django.core.management.base import BaseCommand
from django.contrib.auth.models import User
import environ

class Command(BaseCommand):
    help = "Creates an initial admin user"

    def handle(self, *args, **options):
        env = environ.Env()
        environ.Env.read_env()

        # TODO: delete defaults in production!
        username = env('ADMIN_USERNAME', default='admin')
        email = env('ADMIN_EMAIL', default='admin@example.com')
        password = env('ADMIN_PASSWORD', default='admin')

        if not User.objects.filter(username=username).exists():
            User.objects.create_superuser(username, email, password)
            self.stdout.write(self.style.SUCCESS(f"Successfully created new admin user: {username}"))
        else:
            self.stdout.write(self.style.SUCCESS("Admin user already exists"))
