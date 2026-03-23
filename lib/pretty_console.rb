# Objetivo: proveer helpers de formato y color para output en consola.
# Cómo funciona: usa códigos ANSI escape para aplicar colores, estilos y construir
#   elementos visuales como banners, tablas, barras de progreso y spinners.
#   Detecta automáticamente si la terminal soporta colores.
# Resultado esperado: output bonito y legible en cualquier script del proyecto.
# Dependencias: stdlib.
# Estado: estable
# Fecha de modificación: 2026-03-23
#
# Uso:
#   require_relative '../../lib/pretty_console'
#   include PrettyConsole
#
#   banner("Mi Script", subtitle: "v1.0")
#   success("Todo salió bien")
#   error("Algo falló")
#   warning("Cuidado con esto")
#   info("Dato informativo")
#
# Ejemplos:
#   banner("Port Scanner", subtitle: "TCP connect scan")
#   success("Puerto 80 — ABIERTO")
#   table(["Puerto", "Estado"], [["80", "ABIERTO"], ["443", "CERRADO"]])
#   progress_bar(45, 100, label: "Escaneando")
#   separator

module PrettyConsole
  # ── ANSI color codes ──────────────────────────────────────────────

  COLORS = {
    reset:      "\e[0m",
    bold:       "\e[1m",
    dim:        "\e[2m",
    italic:     "\e[3m",
    underline:  "\e[4m",
    # Foreground
    black:      "\e[30m",
    red:        "\e[31m",
    green:      "\e[32m",
    yellow:     "\e[33m",
    blue:       "\e[34m",
    magenta:    "\e[35m",
    cyan:       "\e[36m",
    white:      "\e[37m",
    # Bright foreground
    bright_red:     "\e[91m",
    bright_green:   "\e[92m",
    bright_yellow:  "\e[93m",
    bright_blue:    "\e[94m",
    bright_magenta: "\e[95m",
    bright_cyan:    "\e[96m",
    bright_white:   "\e[97m",
    # Background
    bg_red:     "\e[41m",
    bg_green:   "\e[42m",
    bg_yellow:  "\e[43m",
    bg_blue:    "\e[44m",
    bg_magenta: "\e[45m",
    bg_cyan:    "\e[46m",
    bg_white:   "\e[47m"
  }.freeze

  # ── Detección de soporte de color ─────────────────────────────────

  def color_supported?
    return @color_supported if defined?(@color_supported)

    @color_supported = $stdout.tty? && ENV['TERM'] != 'dumb' && !ENV.key?('NO_COLOR')
  end

  # ── Colorizar texto ───────────────────────────────────────────────

  def colorize(text, *styles)
    return text.to_s unless color_supported?

    prefix = styles.map { |s| COLORS[s] || '' }.join
    "#{prefix}#{text}#{COLORS[:reset]}"
  end

  # ── Símbolos ──────────────────────────────────────────────────────

  SYMBOLS = {
    check:    '✔',
    cross:    '✖',
    warning:  '⚠',
    info:     'ℹ',
    arrow:    '→',
    bullet:   '●',
    line:     '─',
    corner:   '╭',
    corner_b: '╰',
    vertical: '│',
    dot:      '·'
  }.freeze

  # ── Mensajes con nivel ────────────────────────────────────────────

  def success(msg)
    puts "  #{colorize(SYMBOLS[:check], :bold, :green)}  #{colorize(msg, :green)}"
  end

  def error(msg)
    puts "  #{colorize(SYMBOLS[:cross], :bold, :red)}  #{colorize(msg, :red)}"
  end

  def warning(msg)
    puts "  #{colorize(SYMBOLS[:warning], :bold, :yellow)}  #{colorize(msg, :yellow)}"
  end

  def info(msg)
    puts "  #{colorize(SYMBOLS[:info], :bold, :cyan)}  #{colorize(msg, :cyan)}"
  end

  def muted(msg)
    puts "  #{colorize(msg, :dim)}"
  end

  # ── Banner ────────────────────────────────────────────────────────

  def banner(title, subtitle: nil, width: 50)
    line = SYMBOLS[:line] * width

    puts
    puts colorize("  #{SYMBOLS[:corner]}#{line}", :bright_cyan)
    puts colorize("  #{SYMBOLS[:vertical]}  #{title}", :bold, :bright_white)
    puts colorize("  #{SYMBOLS[:vertical]}  #{subtitle}", :dim) if subtitle
    puts colorize("  #{SYMBOLS[:corner_b]}#{line}", :bright_cyan)
    puts
  end

  # ── Separador ─────────────────────────────────────────────────────

  def separator(width: 50, char: SYMBOLS[:line])
    puts colorize("  #{char * width}", :dim)
  end

  # ── Tabla simple ──────────────────────────────────────────────────

  def table(headers, rows, padding: 2)
    return if headers.empty?

    col_widths = headers.each_with_index.map do |h, i|
      values = rows.map { |r| r[i].to_s.length }
      [h.to_s.length, *values].max + padding
    end

    # Header
    header_line = headers.each_with_index.map { |h, i| h.to_s.ljust(col_widths[i]) }.join
    puts "  #{colorize(header_line, :bold, :bright_white)}"
    puts "  #{colorize(col_widths.map { |w| SYMBOLS[:line] * w }.join, :dim)}"

    # Rows
    rows.each do |row|
      line = row.each_with_index.map { |cell, i| cell.to_s.ljust(col_widths[i]) }.join
      puts "  #{line}"
    end
  end

  # ── Barra de progreso ─────────────────────────────────────────────

  def progress_bar(current, total, width: 30, label: '')
    return if total.zero?

    percent = (current.to_f / total * 100).round(1)
    filled = (current.to_f / total * width).round
    empty = width - filled

    bar = colorize('█' * filled, :bright_cyan) + colorize('░' * empty, :dim)
    status = colorize("#{percent}%", :bold, :bright_white)
    label_text = label.empty? ? '' : "#{colorize(label, :dim)} "

    print "\r  #{label_text}#{bar} #{status} (#{current}/#{total})"
    puts if current == total
  end

  # ── Spinner (bloque con animación) ────────────────────────────────

  def with_spinner(message, &block)
    frames = ['⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏']
    running = true

    spinner_thread = Thread.new do
      i = 0
      while running
        print "\r  #{colorize(frames[i % frames.size], :bright_cyan)} #{message}"
        sleep 0.08
        i += 1
      end
    end

    result = block.call
    running = false
    spinner_thread.join
    print "\r  #{colorize(SYMBOLS[:check], :bold, :green)} #{message}\n"
    result
  end

  # ── Resumen final (key-value) ─────────────────────────────────────

  def summary(data)
    puts
    max_key = data.keys.map { |k| k.to_s.length }.max

    data.each do |key, value|
      k = colorize("#{key.to_s.ljust(max_key)}", :dim)
      puts "  #{k}  #{colorize(value, :bold, :bright_white)}"
    end

    puts
  end
end
