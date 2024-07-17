from django.core.management.base import BaseCommand
from django.contrib.auth.models import User


class Command(BaseCommand):
    print("command")
    help = "Creates an initial admin user"

    def handle(self, *args, **options):
        print("handle")
        if not User.objects.filter(username="admin").exists():
            print("if")
            User.objects.create_superuser("admin", "admin@example.com", "adminpass")
            self.stdout.write(self.style.SUCCESS("Successfully created new admin user"))
        else:
            self.stdout.write(self.style.SUCCESS("Admin user already exists"))
