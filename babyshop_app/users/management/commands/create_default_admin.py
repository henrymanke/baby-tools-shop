from django.core.management.base import BaseCommand
from django.contrib.auth.models import User
import environ


class Command(BaseCommand):
    help = "Creates an initial admin user from environment variables"

    def handle(self, *args, **options):
        env = environ.Env()
        environ.Env.read_env()

        username = env("ADMIN_USERNAME")
        email = env("ADMIN_EMAIL")
        password = env("ADMIN_PASSWORD")

        # Check whether all necessary environment variables are present
        if not username or not email or not password:
            self.stdout.write(
                self.style.ERROR(
                    "Missing one or more required environment variables: ADMIN_USERNAME, ADMIN_EMAIL, ADMIN_PASSWORD"
                )
            )
            return  # Cancels the command if a variable is missing

        if not User.objects.filter(username=username).exists():
            User.objects.create_superuser(username, email, password)
            self.stdout.write(self.style.SUCCESS(f"Successfully created new admin user: {username}"))
        else:
            self.stdout.write(self.style.SUCCESS("Admin user already exists"))
