String windDegToText(int degree) {
  if (degree > 337.5) return 'Северный';
  if (degree > 292.5) return 'Северо-западный';
  if (degree > 247.5) return 'Западный';
  if (degree > 202.5) return 'Юго-западный';
  if (degree > 157.5) return 'Южный';
  if (degree > 122.5) return 'Юго-восточный';
  if (degree > 67.5) return 'Восточный';
  if (degree > 22.5) {
    return 'Северо-восточный';
  }
  return 'Северный';
}
