#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    key_t key = ftok("archivo", 65);  // Generar clave única
    int msqid = msgget(key, 0666 | IPC_CREAT);  // Crear cola de mensajes

    if (msqid == -1) {
        perror("msgget");
        exit(1);
    }

    printf("Cola de mensajes creada con ID: %d\n", msqid);
    return 0;
}
