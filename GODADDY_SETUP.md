# 🌐 GoDaddy DNS Setup for solver.to → GitHub Pages

## Step-by-Step Guide

### 1️⃣ Enable GitHub Pages First

1. Go to: https://github.com/sirmaxworld/ai-solver/settings/pages
2. Under "Source", select:
   - **Source**: Deploy from a branch
   - **Branch**: main
   - **Folder**: / (root)
3. Click "Save"
4. Wait 2-3 minutes for it to build
5. You'll see a green checkmark when ready

### 2️⃣ GoDaddy DNS Configuration

1. **Login to GoDaddy**: https://dcc.godaddy.com/domains/
2. Find **solver.to** and click **DNS** or **Manage DNS**
3. **Delete or modify existing records** if they conflict

### 3️⃣ Add These DNS Records

You need to add these EXACT records:

#### A Records (for apex domain solver.to)
Add ALL four of these:

| Type | Name | Value | TTL |
|------|------|-------|-----|
| A | @ | 185.199.108.153 | 600 |
| A | @ | 185.199.109.153 | 600 |
| A | @ | 185.199.110.153 | 600 |
| A | @ | 185.199.111.153 | 600 |

#### CNAME Record (for www.solver.to)

| Type | Name | Value | TTL |
|------|------|-------|-----|
| CNAME | www | sirmaxworld.github.io | 600 |

### 4️⃣ How to Add Records in GoDaddy

1. Click **"ADD"** button in DNS Management
2. For A Records:
   - Type: **A**
   - Name: **@** (this means solver.to)
   - Value: **185.199.108.153** (add each IP separately)
   - TTL: **600 seconds** (or use default)
   - Click **Save**
   - Repeat for all 4 IPs

3. For CNAME Record:
   - Type: **CNAME**
   - Name: **www**
   - Value: **sirmaxworld.github.io**
   - TTL: **600 seconds**
   - Click **Save**

### 5️⃣ Remove Conflicting Records

⚠️ **Important**: Remove or edit these if they exist:
- Any **A record** with name "@" pointing to different IPs
- Any **CNAME** record with name "@" (apex domain can't be CNAME)
- GoDaddy's default parking page records

### 6️⃣ Verify Setup

After saving all records:

1. **Wait 10-30 minutes** (DNS propagation)
2. **Test your domain**:
   ```bash
   # Check DNS records
   dig solver.to
   dig www.solver.to
   
   # Or use online tool
   https://dns.google/query?name=solver.to
   ```

3. **Visit your site**:
   - https://solver.to
   - https://www.solver.to

### 7️⃣ Enable HTTPS (Automatic)

GitHub Pages automatically provides HTTPS. After DNS propagates:
1. Go to: https://github.com/sirmaxworld/ai-solver/settings/pages
2. Check **"Enforce HTTPS"** checkbox
3. This enables SSL certificate from Let's Encrypt

## 🔧 Troubleshooting

### "404 Not Found" Error
- Make sure `index.html` exists in your repository root
- Check that GitHub Pages is enabled
- Wait up to 10 minutes for GitHub to deploy

### "DNS_PROBE_FINISHED_NXDOMAIN"
- DNS hasn't propagated yet (wait up to 48 hours, usually 30 minutes)
- Double-check all 4 A records are added
- Verify no typos in the IP addresses

### "This site can't provide a secure connection"
- Wait for GitHub to provision SSL certificate (up to 24 hours)
- Make sure all 4 A records are correct
- Check that CNAME file contains exactly: `solver.to`

### Still Not Working?
1. **Check GitHub Pages Status**:
   - Go to Settings → Pages
   - Should show: "Your site is published at https://solver.to"

2. **Verify DNS Records**:
   ```bash
   nslookup solver.to
   # Should return: 185.199.108.153, 185.199.109.153, etc.
   ```

3. **Clear Browser Cache**:
   - Hard refresh: Cmd+Shift+R (Mac) or Ctrl+Shift+R (Windows)
   - Try incognito/private browsing mode

## ✅ Success Checklist

- [ ] GitHub Pages enabled on main branch
- [ ] CNAME file with `solver.to` pushed to repository
- [ ] 4 A records added in GoDaddy (185.199.108.153, .109., .110., .111.)
- [ ] CNAME record for www → sirmaxworld.github.io
- [ ] Removed conflicting records
- [ ] Waited for DNS propagation
- [ ] Site loads at https://solver.to
- [ ] HTTPS is working (green padlock)

## 📞 Need Help?

- **GitHub Pages Docs**: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site
- **GoDaddy Support**: 1-480-505-8877
- **DNS Checker**: https://dnschecker.org/#A/solver.to

---

💡 **Pro Tip**: Use GoDaddy's "Forwarding" feature to redirect solver.to to www.solver.to if you prefer www as primary.