# Goodbox Links

Página de links estilo Linktree para a Goodbox, pronta para deploy no **Coolify** via Docker + GitHub.

## Como editar os links

Edite o arquivo [`public/config.json`](public/config.json):

```json
{
  "brand": "Goodbox",
  "tagline": "Seus atalhos essenciais, reunidos em um só lugar.",
  "avatarText": "GB",
  "avatarImage": "",
  "credit": "© Goodbox",
  "links": [
    {
      "title": "WhatsApp",
      "description": "Fale com nosso atendimento",
      "url": "https://wa.me/5511999999999",
      "icon": "whatsapp"
    }
  ],
  "socials": [
    {
      "label": "Instagram",
      "url": "https://instagram.com/seuusuario",
      "icon": "instagram"
    }
  ]
}
```

Ícones disponíveis: `globe`, `whatsapp`, `instagram`, `mail`, `box`, `link`, `map`, `phone`.

Para usar uma foto de perfil, coloque a imagem em `public/` e preencha `avatarImage`, por exemplo: `"avatar.jpg"`.

## Rodar localmente com Docker

```bash
docker compose up --build
```

Abra: http://localhost:8080

## Deploy no Coolify

1. No Coolify, crie um novo recurso **Public Repository** (ou Private, se preferir).
2. Conecte este repositório do GitHub.
3. Build Pack: **Dockerfile** (não Nixpacks).
4. **Ports Exposes**: `80` (obrigatório — se estiver 3000/8080, dá Bad Gateway).
5. Domínio: `linktree.goodbox.com.br`
6. Faça o deploy.

Não precisa de variáveis de ambiente, Node ou banco — é Nginx servindo arquivos estáticos.

### Bad Gateway?

No Coolify, abra o app → **Configuration → Network** e confirme **Ports Exposes = 80**. Depois **Redeploy**. Veja também os logs do container: se o build falhou ou o container parou, o proxy devolve Bad Gateway.

## Estrutura

```
├── Dockerfile
├── docker-compose.yml
├── nginx.conf
└── public/
    ├── index.html
    ├── styles.css
    ├── app.js
    └── config.json   ← edite aqui
```
