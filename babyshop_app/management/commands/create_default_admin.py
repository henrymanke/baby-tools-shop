from django.core.management.base import BaseCommand
from django.contrib.auth.models import User


class Command(BaseCommand):
    help = "Creates an initial admin user"

    def handle(self, *args, **options):
        if not User.objects.filter(username="admin").exists():
            User.objects.create_superuser("admin", "admin@example.com", "adminpass")
            self.stdout.write(self.style.SUCCESS("Successfully created new admin user"))
        else:
            self.stdout.write(self.style.SUCCESS("Admin user already exists"))