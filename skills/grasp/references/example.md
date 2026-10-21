# Example output

A complete example for a made-up PR in a made-up online shop. It shows every part of the format, including before/after code (which you add only when you have the diff).

Notice:
- The About block explains the cart before the change, for someone who never used it.
- Overview comes right after Key terms, before the Change hook.
- The hook is 7 words and uses common words.
- The part numbers (1)–(3) appear in the overview, map, use case, and detail.
- The "Live for users today" line names the one part that runs outside the flag.
- "What else happens" has ⚠️ rows that the PR description does not stress.

---

acme/shop#1234 · Full stack · 18 files, +920 −140 · SHOP-210

## About: Shopping cart

The cart holds the items a shopper plans to buy. Shoppers can change quantities or remove items before checkout. A removed item is deleted from the cart, and the shopper must find it again to buy it later.

<details>
<summary><b>Key terms</b></summary>

| Term | Meaning |
|---|---|
| Cart row | One product in the cart, with its quantity and price |
| Saved for later | A new list under the cart for items the shopper wants to keep but not buy now |
| `formatPrice` | A shared helper that turns a number into a price label, like "$5.00" |

</details>

<details>
<summary><b>Overview</b></summary>

| | |
|---|---|
| **Why** | Shoppers remove items they still want, then cannot find them again. This keeps those items. |
| **(1) API and table** | New `saved_items` table and two endpoints. Only the owner can read or change their saved items. |
| **(2) Cart page** | New button on each cart row, and a "Saved for later" list under the cart. |
| **(3) `formatPrice`** | Always shows two decimals. The saved list needed it, but every page uses it. |
| **Check this** | Part 3 reaches every price, including emails. Out-of-stock saved items. |

</details>

## Change: Shoppers can save cart items for later.

Before, removing an item from the cart lost it. Now shoppers can move an item to a "Saved for later" list and move it back.

| Stop | Here | Changed |
|---|---|---|
| Who | Logged-in shopper | — |
| Screen | Cart page | (2) (3) |
| Endpoint | New `POST /api/saved-items`, `DELETE /api/saved-items/:id` | (1) |
| Logic | Move an item between cart and saved list | (1) |
| Data | New `saved_items` table | (1) |

**Parts**
- (1) API and table for saved items
- (2) "Save for later" button and list on the cart page
- (3) Shared `formatPrice` helper now always shows two decimals

**Live for users today:** Partly. Parts 1–2 are behind the `savedForLater` flag, which is on only for internal test accounts. Part 3 is not behind the flag. It changes every price shown on the site.

<details>
<summary><b>Use case:</b> keeping a gift for next month</summary>

A shopper has three items in the cart. One is a gift they want to buy next month.

**Before**
1. Shopper removes the gift from the cart
2. The item is gone
3. Next month, the shopper searches for it again

**After**
1. (2) Shopper clicks "Save for later" on the gift
2. (1) The item moves to the saved list, and the cart total updates
3. Next month, the shopper clicks "Move to cart"

**What else happens**

| Situation | Result |
|---|---|
| Shopper is logged out | The button is hidden. Saving needs an account. |
| Double click on "Save for later" | Only one saved row. The table has a unique key on user and product. |
| Flag is off | No button, no new API calls. Cart works as before. |
| ⚠️ Saved item goes out of stock | "Move to cart" behavior is not covered by tests. Check what the shopper sees. |
| ⚠️ Every price on the site | (3) "$5" now shows as "$5.00". Order emails and invoices also use `formatPrice`. Check them. |

</details>

<details>
<summary><b>Detail</b></summary>

**(1) API and table**
- Files: `migrations/20260301_saved_items.sql`, `api/routes/savedItems.ts`, `api/services/savedItems.ts`
- Unique key on (`user_id`, `product_id`).

**(2) Cart page**
- Files: `web/cart/CartRow.tsx`, `web/cart/SavedList.tsx` (new)
- Both check the `savedForLater` flag.

**(3) `formatPrice`**
- File: `shared/formatPrice.ts`
- Used in 41 places, including `emails/orderConfirmation.tsx`.

Before:
```ts
return `$${amount}`;
```
After:
```ts
return `$${amount.toFixed(2)}`;
```

**Tests:** Unit tests for the service and the helper. One e2e test for save and move back. No test for out-of-stock items.

**Not checked:** Email templates that may format prices without the helper.

</details>
