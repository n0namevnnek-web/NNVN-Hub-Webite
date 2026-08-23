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

## Luu y

- Ban free co the bi pause neu khong co hoat dong mot thoi gian.
- Muc nay chi dem view cho giao dien danh sach / modal script.
- Muc `Protect Script` hien van la giao dien + validate Luau co ban, khong phai he thong phat link thuc thi an noi dung.
