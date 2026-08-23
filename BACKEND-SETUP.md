# NNVN Hub Backend Setup

## Muc tieu

File nay giup ban doi tu `view demo` sang `view that` bang Supabase free.

Nguon chinh thuc minh da kiem tra:

- [Supabase Pricing](https://supabase.com/pricing)
- [Supabase Getting Started](https://supabase.com/docs/guides/getting-started)
- [supabase-js / JavaScript intro](https://supabase.com/docs/reference/javascript/introduction)

Tai thoi diem kiem tra ngay 23/08/2026, Supabase van co goi free va phu hop cho du an nho. Theo trang pricing cua ho, goi free danh cho simple websites va passion projects, co gioi han du an khong hoat dong se bi pause sau 1 tuan.

## Cach bat view that

1. Tao 1 project Supabase.
2. Vao SQL Editor.
3. Chay noi dung trong [supabase-setup.sql](D:/NNVN%20hub/Website/supabase-setup.sql).
4. Vao Project Settings > API.
5. Copy:
   - Project URL
   - anon public key
6. Mo [backend-config.js](D:/NNVN%20hub/Website/backend-config.js) va dien:

```js
window.NNVN_BACKEND = {
  supabaseUrl: "https://YOUR_PROJECT.supabase.co",
  supabaseAnonKey: "YOUR_ANON_KEY"
};
```

7. Tai lai web.

## Ket qua

- Neu chua dien config: web hien `View demo`
- Neu da dien config dung: web hien `View that`
- Khi dang nhap Discord thanh cong: muc `Protect Script` se luu file theo tung tai khoan Discord rieng.

## Bat kho Protect Script rieng cho tung user

1. Vao Supabase project.
2. Vao `SQL Editor`.
3. Copy toan bo noi dung file [supabase-setup.sql](D:/NNVN%20hub/Website/supabase-setup.sql).
4. Bam `Run`.

Bang `protected_scripts` co `owner_id = auth.uid()`, nen user A chi doc/sua/xoa file cua user A,
user B chi thay file cua user B.

## Cach bat login Discord that

Login tren web dung Supabase Auth. Ban can lam 3 phan:

1. Trong Supabase, vao `Project Settings > API`.
2. Copy `Project URL` va `anon public key` vao [backend-config.js](D:/NNVN%20hub/Website/backend-config.js).
3. Vao `Authentication > Providers`, bat `Discord`.

Redirect URL nen them:

```text
https://n0namevnnek-web.github.io/NNVN-Hub-Webite/
```

Trong Supabase, vao `Authentication > URL Configuration`, dat:

```text
Site URL: https://n0namevnnek-web.github.io/NNVN-Hub-Webite/
Redirect URLs: https://n0namevnnek-web.github.io/NNVN-Hub-Webite/
```

Neu test tren may tinh thi them ca:

```text
http://localhost:3000
file:///D:/NNVN%20hub/Website/index.html
```

Voi Discord, ban can tao OAuth app rieng trong Discord Developer Portal,
roi copy `Client ID` va `Client Secret` vao Supabase Provider.
Khi dang nhap thanh cong, web se lay ten tai khoan va avatar Discord tu Supabase user metadata de hien o menu trai.

Tai lieu chinh thuc:

- Supabase Discord login: https://supabase.com/docs/guides/auth/social-login/auth-discord
- Supabase signInWithOAuth: https://supabase.com/docs/reference/javascript/auth-signinwithoauth

## Luu y

- Ban free co the bi pause neu khong co hoat dong mot thoi gian.
- Muc nay chi dem view cho giao dien danh sach / modal script.
- Muc `Protect Script` hien van la giao dien + validate Luau co ban, khong phai he thong phat link thuc thi an noi dung.
