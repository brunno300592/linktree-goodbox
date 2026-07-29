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

## SEO e Google

O site já inclui:

- `robots.txt` e `sitemap.xml`
- Meta tags (description, canonical, Open Graph, Twitter)
- Dados estruturados JSON-LD (Organization, WebSite, WebPage, ItemList)
- Manifest PWA e imagem de compartilhamento (`og-image.png`)

**Para o Google indexar:**

1. Abra o [Google Search Console](https://search.google.com/search-console)
2. Adicione a propriedade `https://linktree.goodbox.com.br`
3. Valide por DNS (domínio goodbox.com.br) ou tag HTML
4. Envie o sitemap: `https://linktree.goodbox.com.br/sitemap.xml`
5. Use **Inspeção de URL** em `https://linktree.goodbox.com.br/` e peça indexação

Campos SEO opcionais em `config.json`: `tagline`, `seoTitle`, `seoDescription`, `canonicalUrl`.

## Estrutura

```
├── Dockerfile
├── docker-compose.yml
├── nginx.conf
└── public/
    ├── index.html
    ├── styles.css
    ├── app.js
    ├── config.json   ← edite aqui
    ├── robots.txt
    ├── sitemap.xml
    ├── site.webmanifest
    └── og-image.png
```
