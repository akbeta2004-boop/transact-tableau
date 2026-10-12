CREATE TABLE IF NOT EXISTS public.access_keys (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  key_hash text NOT NULL UNIQUE,
  claimed_device_hash text,
  claimed_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now()
);
GRANT ALL ON public.access_keys TO service_role;
ALTER TABLE public.access_keys ENABLE ROW LEVEL SECURITY;