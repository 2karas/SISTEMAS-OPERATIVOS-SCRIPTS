#!/bin/bash

# Definir grupos y sus permisos (esto es informativo, no se usa en el script)
declare -A groups_permissions=(
    ["admin"]="rwx"
    ["dev"]="rwx"
    ["ops"]="r-x"
)

# Definir usuarios y sus grupos asignados
declare -A users_groups=(
    ["jaider"]="admin dev"
    ["enrique"]="dev"
    ["reyes"]="ops"
)

# Crear grupos si no existen
for group in "${!groups_permissions[@]}"; do 
    if ! grep -q "^$group:" /etc/group; then
        echo "Creando grupo $group..."
        groupadd "$group"
    else
        echo "El grupo $group ya existe."
    fi
done

# Crear usuarios, asignarlos a grupos y configurar directorios de inicio
for user in "${!users_groups[@]}"; do 
    if ! id -u "$user" &>/dev/null; then
        echo "Creando usuario $user..."
        useradd -m -d "/home/$user" -s /bin/bash "$user"
        echo "Usuario $user creado."

        # Asignar usuario a los grupos especificados
        for group in ${users_groups[$user]}; do 
            usermod -aG "$group" "$user"
            echo "Usuario $user agregado al grupo $group."
        done

        # Configurar permisos en el directorio de inicio
        chmod 700 "/home/$user"
        echo "Permisos configurados para /home/$user."

        # Establecer políticas de seguridad (ejemplo: caducidad de contraseña)
        chage -m 7 -M 90 -W 14 "$user" # Cambiar contraseña cada 90 días, con advertencia 14 días antes
        echo "Políticas de seguridad aplicadas para $user."

    else
        echo "El usuario $user ya existe."
    fi
done

echo "Script completado."
